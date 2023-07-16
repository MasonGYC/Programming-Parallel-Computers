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

Result segment(int ny, int nx, const float *data)
{
    Result result{0, 0, 0, 0, {0, 0, 0}, {0, 0, 0}};
    float min_error = INFINITY;

    // different sizes
    for (int h = 1; h <= ny; h++)
    {
        for (int w = 1; w <= nx; w++)
        {
            if (ny * nx - h * w == 0) continue;

            // different positions
            for (int y0 = 0; y0 <= ny - h; y0++)
            {
                for (int x0 = 0; x0 <= nx - w; x0++)
                {
                    // for this segmentation, loop all pixels
                    float outer[3] = {0, 0, 0};
                    float inner[3] = {0, 0, 0};
                    float error[3] = {0, 0, 0};
                    float error_sum = 0;

                    float pixel[3];

                    // calculate outer and inner: get average
                    for (int y = 0; y < ny; y++)
                    {
                        for (int x = 0; x < nx; x++)
                        {
                            pixel[0] = data[0 + 3 * x + 3 * nx * y];
                            pixel[1] = data[1 + 3 * x + 3 * nx * y];
                            pixel[2] = data[2 + 3 * x + 3 * nx * y];

                            if (y >= y0 && y < y0 + h && x >= x0 && x < x0 + w)
                            {
                                for (int c = 0; c < 3; c++)
                                {
                                    inner[c] += pixel[c];
                                }
                            }
                            else
                            {
                                for (int c = 0; c < 3; c++)
                                {
                                    outer[c] += pixel[c];
                                }
                            }
                        }
                    }
                    for (int c = 0; c < 3; c++)
                    {
                        inner[c] /= h * w;
                        outer[c] /= ny * nx - h * w;
                    }

                    // calculate sum of squares
                    for (int y = 0; y < ny; y++)
                    {
                        for (int x = 0; x < nx; x++)
                        {
                            if (y >= y0 && y < y0 + h && x >= x0 && x < x0 + w)
                            {
                                for (int c = 0; c < 3; c++)
                                {
                                    error[c] += pow(inner[c] - pixel[c], 2);
                                }
                            }
                            else
                            {
                                for (int c = 0; c < 3; c++)
                                {
                                    error[c] += pow(outer[c] - pixel[c], 2);
                                }
                            }
                        }
                    }

                    for (int c = 0; c < 3; c++)
                    {
                        error_sum += error[c];
                    }

                    if (error_sum < min_error)
                    {
                        min_error = error_sum;
                        result.y0 = y0;
                        result.x0 = x0;
                        result.y1 = y0 + h;
                        result.x1 = x0 + w;
                        for (int c = 0; c < 3; c++)
                        {
                            result.outer[c] = outer[c];
                            result.inner[c] = inner[c];
                        }
                    }
                }
            }
        }
    }

    return result;
}
