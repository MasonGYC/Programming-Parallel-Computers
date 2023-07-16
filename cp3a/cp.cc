/*
This is the function you need to implement. Quick reference:
- input rows: 0 <= y < ny
- input columns: 0 <= x < nx
- element at row y and column x is stored in data[x + y*nx]
- correlation between rows i and row j has to be stored in result[i + j*ny]
- only parts with 0 <= j <= i < ny need to be filled
*/
#include <cmath>
#include <vector>
#include <random>
#include <iostream>

typedef double double4_t
    __attribute__((vector_size(4 * sizeof(double))));

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

void correlate(int ny, int nx, const float *data, float *result)
{
    // First normalize the input rows so that each row has the arithmetic mean of 0
    // Then normalize the input rows so that for each row the sum of the squares of the elements is 1

    int nv = (nx + 3) / 4;
    int pad_index = nx % 4;
    double4_t *Xvec = double4_alloc((ny + 1) * nv);

    for (int y = 0; y < ny; y++)
    {
        // get average of this row
        double ave1 = 0;
        double ave2 = 0;
        for (int x = 0; x < nx; x += 2)
        {
            ave1 += (double)data[x + y * nx];
            if (x + 1 < nx)
            {
                ave2 += (double)data[x + 1 + y * nx];
            }
        }
        double ave = (ave1 + ave2) / nx;

        // get std of this row
        double std1 = 0;
        double std2 = 0;
        for (int x = 0; x < nx; x += 2)
        {
            std1 += (double)pow((data[x + y * nx] - ave), 2);
            if (x + 1 < nx)
            {
                std2 += (double)pow((data[x + 1 + y * nx] - ave), 2);
            }
        }
        double std = sqrt(std1 + std2);

// fill in Xvec of this row
#pragma omp parallel for
        for (int x = 0; x < nx - nx % 4; x += 4)
        {
            __builtin_prefetch(&data[x + 4 + y * nx]);
            int offset = x / 4;
            Xvec[y * nv + offset] = double4_t{(double)(data[x + y * nx] - ave) / std,
                                              (double)(data[x + 1 + y * nx] - ave) / std,
                                              (double)(data[x + 2 + y * nx] - ave) / std,
                                              (double)(data[x + 3 + y * nx] - ave) / std};
        }
        for (int x = nx - nx % 4; x < nx; x++)
        {
            int offset = x / 4;
            Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
        }
    }
    // pad Xvec
    if (pad_index > 0)
    {
        for (int row = nv - 1; row < ny * nv; row += nv)
        {
            for (int pad_idx = pad_index; pad_idx < 4; pad_idx++)
            {
                Xvec[row][pad_idx] = (double)0;
            }
        }
    }

    int s = 6; // kernel size s*s

    for (int r = 0; r < ny; r += s)
    {
        __builtin_prefetch(&Xvec[(r + s) * nv]);
#pragma omp parallel for
        for (int c = r; c < ny; c += s)
        {
            int j_up = std::min(r + s, ny);
            int i_up = std::min(c + s, ny);

            for (int j = r; j < j_up; j += 3)
            {
                for (int i = c; i < i_up; i += 3)
                {
                    double4_t temp00 = ZERO4;
                    double4_t temp01 = ZERO4;
                    double4_t temp02 = ZERO4;
                    double4_t temp10 = ZERO4;
                    double4_t temp11 = ZERO4;
                    double4_t temp12 = ZERO4;
                    double4_t temp20 = ZERO4;
                    double4_t temp21 = ZERO4;
                    double4_t temp22 = ZERO4;

                    for (int k = 0; k < nv; k++)
                    {
                        double4_t i0vec = Xvec[i * nv + k];
                        double4_t i1vec;
                        double4_t i2vec;
                        double4_t j0vec = Xvec[j * nv + k];
                        double4_t j1vec;
                        double4_t j2vec;

                        temp00 += j0vec * i0vec;
                        if (i + 1 < i_up)
                        {
                            i1vec = Xvec[(i + 1) * nv + k];
                            temp01 += j0vec * i1vec;
                        }
                        if (i + 2 < i_up)
                        {
                            i2vec = Xvec[(i + 2) * nv + k];
                            temp02 += j0vec * i2vec;
                        }

                        if (j + 1 < j_up)
                        {
                            j1vec = Xvec[((j + 1)) * nv + k];
                            temp10 += j1vec * i0vec;
                            if (i + 1 < i_up)
                            {
                                temp11 += j1vec * i1vec;
                            }
                            if (i + 2 < i_up)
                            {
                                temp12 += j1vec * i2vec;
                            }
                        }

                        if (j + 2 < j_up)
                        {
                            j2vec = Xvec[((j + 2)) * nv + k];
                            temp20 += j2vec * i0vec;
                            if (i + 1 < i_up)
                            {
                                temp21 += j2vec * i1vec;
                            }
                            if (i + 2 < i_up)
                            {
                                temp22 += j2vec * i2vec;
                            }
                        }
                    }
                    result[j * ny + i] = float(sum_double4(temp00));
                    if (i + 1 < i_up)
                    {
                        result[j * ny + i + 1] = float(sum_double4(temp01));
                    }
                    if (i + 2 < i_up)
                    {
                        result[j * ny + i + 2] = float(sum_double4(temp02));
                    }

                    if (j + 1 < j_up)
                    {
                        result[(j + 1) * ny + i] = float(sum_double4(temp10));
                        if (i + 1 < i_up)
                        {
                            result[(j + 1) * ny + i + 1] = float(sum_double4(temp11));
                        }
                        if (i + 2 < i_up)
                        {
                            result[(j + 1) * ny + i + 2] = float(sum_double4(temp12));
                        }
                    }
                    if (j + 2 < j_up)
                    {
                        result[(j + 2) * ny + i] = float(sum_double4(temp20));
                        if (i + 1 < i_up)
                        {
                            result[(j + 2) * ny + i + 1] = float(sum_double4(temp21));
                        }
                        if (i + 2 < i_up)
                        {
                            result[(j + 2) * ny + i + 2] = float(sum_double4(temp22));
                        }
                    }
                }
            }
        }
    }
    std::free(Xvec);
}
