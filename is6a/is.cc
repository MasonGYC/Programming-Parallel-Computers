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

typedef float float4_t
    __attribute__((vector_size(4 * sizeof(float))));

static float4_t *double4_alloc(std::size_t n)
{
    void *tmp = 0;
    if (posix_memalign(&tmp, sizeof(float4_t), sizeof(float4_t) * n))
    {
        throw std::bad_alloc();
    }
    return (float4_t *)tmp;
}

const float4_t ZERO4 = {0, 0, 0, 0};

Result segment(int ny, int nx, const float *data)
{
    int best_y0{0}, best_x0{0}, best_h{0}, best_w{0};

    double min_error = INFINITY;
    int prfetch = 20;
    int pixels = nx * ny;
    float *rgbVec = (float *)malloc(pixels * sizeof(float));
    float *sumArray = (float *)malloc((ny + 1) * (nx + 1) * sizeof(float)); // store all sums of all shapes

    // create rgb vectors
    for (int y = 0; y < ny; y++)
    {
#pragma omp parallel for
        for (int x = 0; x < nx; x++)
        {
            rgbVec[x + nx * y] = data[3 * x + 3 * nx * y];
        }
    }

// 0 = first col and row of sumArray
#pragma omp parallel for
    for (int y1 = 0; y1 <= ny; y1++)
    {
        sumArray[(nx + 1) * y1] = 0.0f;
    }
#pragma omp parallel for
    for (int x1 = 1; x1 <= nx; x1++)
    {
        sumArray[x1] = 0.0f;
    }

    // calculate sums of all possible rects
    // no parallel
    for (int y1 = 1; y1 <= ny; y1++)
    {
        for (int x1 = 1; x1 <= nx; x1++)
        {
            // __builtin_prefetch(&sumArray[x1 + prfetch + (nx + 1) * (y1 - 1)]);
            // __builtin_prefetch(&sumArray[(x1 - 1) + prfetch + (nx + 1) * (y1 - 1)]);
            // __builtin_prefetch(&rgbVec[(x1 - 1) + prfetch + nx * (y1 - 1)]);

            float left = sumArray[(x1 - 1) + (nx + 1) * y1];
            float top = sumArray[x1 + (nx + 1) * (y1 - 1)];
            float lefttop = sumArray[(x1 - 1) + (nx + 1) * (y1 - 1)];
            sumArray[x1 + (nx + 1) * y1] = left + top - lefttop + rgbVec[(x1 - 1) + nx * (y1 - 1)];
        }
    }

    float all_sum = sumArray[nx + (nx + 1) * ny];

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
                        float inv_inner = static_cast<float>(1) / num_inner;
                        float inv_outer = static_cast<float>(1) / num_outer;

                        // sum inner
                        float inner_sum = sumArray[x1 + (nx + 1) * y1] - sumArray[x0 + (nx + 1) * y1] - sumArray[x1 + (nx + 1) * y0] + sumArray[x0 + (nx + 1) * y0];

                        // get average
                        float outer_sum = all_sum - inner_sum;
                        float inner_ave = inv_inner * inner_sum;
                        float outer_ave = inv_outer * outer_sum;

                        // calculate sum of squares
                        float error = -(inner_sum * inner_ave + outer_sum * outer_ave);

                        if (error < min_error_w)
                        {
                            min_error_w = error;
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
    float inv_inner = static_cast<float>(1) / num_inner;
    float inv_outer = static_cast<float>(1) / num_outer;

    float result_inner = sumArray[best_x1 + (nx + 1) * best_y1] - sumArray[best_x0 + (nx + 1) * best_y1] - sumArray[best_x1 + (nx + 1) * best_y0] + sumArray[best_x0 + (nx + 1) * best_y0];
    float result_outer = all_sum - result_inner;
    result_inner *= inv_inner;
    result_outer *= inv_outer;

    Result result{
        best_y0,
        best_x0,
        best_y1,
        best_x1,
        {result_outer, result_outer, result_outer},
        {result_inner, result_inner, result_inner},
    };

    std::free(rgbVec);
    std::free(sumArray);
    return result;
}