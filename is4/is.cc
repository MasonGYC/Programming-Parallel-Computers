struct Result
{
    int y0;
    int x0;
    int y1;
    int x1;
    float outer[3];
    float inner[3];
};

/*
This is the function you need to implement. Quick reference:
- x coordinates: 0 <= x < nx
- y coordinates: 0 <= y < ny
- color components: 0 <= c < 3
- input: data[c + 3 * x + 3 * nx * y]

- upper left corner (x0, y0)
- lower right corner (x1-1, y1-1)
- width = x1-x0 pixels, height = y1-y0 pixels

Let color(y,x,c) = data[c + 3 * x + 3 * nx * y].
If (x,y) is located outside the rectangle: error(y,x,c) = outer[c] - color(y,x,c).
If (x,y) is located inside the rectangle: error(y,x,c) = inner[c] - color(y,x,c)
*/

#include <math.h>
#include <iostream>

typedef double double4_t
    __attribute__((vector_size(4 * sizeof(double))));

typedef int int4_t
    __attribute__((vector_size(4 * sizeof(int))));

static double4_t *double4_alloc(std::size_t n)
{
    void *tmp = 0;
    if (posix_memalign(&tmp, sizeof(double4_t), sizeof(double4_t) * n))
    {
        throw std::bad_alloc();
    }
    return (double4_t *)tmp;
}

const double4_t ZERO4 = {0, 0, 0, 0};

static inline double sum_double4(double4_t arr)
{
    double res = 0;
    for (int i = 0; i < 4; i++)
    {
        res += arr[i];
    }
    return res;
}

Result segment(int ny, int nx, const float *data)
{
    int best_y0{0}, best_x0{0}, best_h{0}, best_w{0};

    double min_error = INFINITY;
    int prfetch = 20;
    int pixels = nx * ny;
    double4_t *rgbVec = double4_alloc(pixels);                // each pixel one vec 3/4
    double4_t *sumArray = double4_alloc((ny + 1) * (nx + 1)); // store all sums of all shapes

    // create rgb vectors
    for (int y = 0; y < ny; y++)
    {
#pragma omp parallel for
        for (int x = 0; x < nx; x++)
        {
            rgbVec[x + nx * y] = double4_t{data[3 * x + 3 * nx * y],
                                           data[1 + 3 * x + 3 * nx * y],
                                           data[2 + 3 * x + 3 * nx * y],
                                           0.0};
        }
    }

// 0 = first col and row of sumArray
#pragma omp parallel for
    for (int y1 = 0; y1 <= ny; y1++)
    {
        sumArray[(nx + 1) * y1] = ZERO4;
    }
#pragma omp parallel for
    for (int x1 = 1; x1 <= nx; x1++)
    {
        sumArray[x1] = ZERO4;
    }

    // calculate sums of all possible rects
    // no parallel
    for (int y1 = 1; y1 <= ny; y1++)
    {
        for (int x1 = 1; x1 <= nx; x1++)
        {
            __builtin_prefetch(&sumArray[x1 + prfetch + (nx + 1) * (y1 - 1)]);
            __builtin_prefetch(&sumArray[(x1 - 1) + prfetch + (nx + 1) * (y1 - 1)]);
            __builtin_prefetch(&rgbVec[(x1 - 1) + prfetch + nx * (y1 - 1)]);

            double4_t left = sumArray[(x1 - 1) + (nx + 1) * y1];
            double4_t top = sumArray[x1 + (nx + 1) * (y1 - 1)];
            double4_t lefttop = sumArray[(x1 - 1) + (nx + 1) * (y1 - 1)];
            sumArray[x1 + (nx + 1) * y1] = left + top - lefttop + rgbVec[(x1 - 1) + nx * (y1 - 1)];
        }
    }

    double4_t all_sum = sumArray[nx + (nx + 1) * ny];

#pragma omp parallel
    {
// different sizes
#pragma omp for schedule(dynamic)
        for (int h = 1; h <= ny; h++)
        {
            double min_error_h = INFINITY;
            int best_y0_h{0}, best_x0_h{0}, best_w_h{0};

            for (int w = 1; w <= nx; w++)
            {
                // not same size as the image itself
                if (pixels == h * w)
                    continue;

                double min_error_w = INFINITY;
                int best_y0_w{0}, best_x0_w{0};

                // different positions
                for (int y0 = 0; y0 <= ny - h; y0++)
                {
                    int y1 = y0 + h;

                    for (int x0 = 0; x0 <= nx - w; x0++)
                    {
                        int x1 = x0 + w;

                        // for this segmentation, loop all pixels
                        int num_inner = h * w;
                        int num_outer = pixels - num_inner;
                        double inv_inner = static_cast<double>(1) / num_inner;
                        double inv_outer = static_cast<double>(1) / num_outer;

                        // sum inner
                        double4_t inner_sum = sumArray[x1 + (nx + 1) * y1] - sumArray[x0 + (nx + 1) * y1] - sumArray[x1 + (nx + 1) * y0] + sumArray[x0 + (nx + 1) * y0];

                        // get average
                        double4_t outer_sum = all_sum - inner_sum;
                        double4_t inner_ave = inv_inner * inner_sum;
                        double4_t outer_ave = inv_outer * outer_sum;

                        // calculate sum of squares
                        double4_t error = -(inner_sum * inner_ave + outer_sum * outer_ave);

                        double error_sum = error[0] + error[1] + error[2];

                        if (error_sum < min_error_w)
                        {
                            min_error_w = error_sum;
                            best_y0_w = y0;
                            best_x0_w = x0;
                        }
                    }
                }
                if (min_error_w <= min_error_h)
                {
                    min_error_h = min_error_w;
                    best_y0_h = best_y0_w;
                    best_x0_h = best_x0_w;
                    best_w_h = w;
                }
            }
#pragma omp critical
            if (min_error_h <= min_error)
            {
                min_error = min_error_h;
                best_y0 = best_y0_h;
                best_x0 = best_x0_h;
                best_h = h;
                best_w = best_w_h;
            }
        }
    }

    int best_y1 = best_y0 + best_h;
    int best_x1 = best_x0 + best_w;
    int num_inner = best_h * best_w;
    int num_outer = pixels - num_inner;
    double inv_inner = static_cast<double>(1) / num_inner;
    double inv_outer = static_cast<double>(1) / num_outer;

    double4_t result_inner = sumArray[best_x1 + (nx + 1) * best_y1] - sumArray[best_x0 + (nx + 1) * best_y1] - sumArray[best_x1 + (nx + 1) * best_y0] + sumArray[best_x0 + (nx + 1) * best_y0];
    double4_t result_outer = all_sum - result_inner;
    result_inner *= inv_inner;
    result_outer *= inv_outer;

    Result result{
        best_y0,
        best_x0,
        best_y1,
        best_x1,
        {(float)result_outer[0], (float)result_outer[1], (float)result_outer[2]},
        {(float)result_inner[0], (float)result_inner[1], (float)result_inner[2]},
    };

    std::free(rgbVec);
    std::free(sumArray);
    return result;
}