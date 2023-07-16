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

typedef float float8_t
    __attribute__((vector_size(8 * sizeof(float))));

static float8_t *float8_alloc(std::size_t n)
{
    void *tmp = 0;
    if (posix_memalign(&tmp, sizeof(float8_t), sizeof(float8_t) * n))
    {
        throw std::bad_alloc();
    }
    return (float8_t *)tmp;
}

constexpr float8_t ZERO8{
    0.0f, 0.0f, 0.0f, 0.0f,
    0.0f, 0.0f, 0.0f, 0.0f};

static inline float sum_float8(float8_t arr)
{
    float res1 = 0;
    float res2 = 0;
    for (int i = 0; i < 8; i += 2)
    {
        res1 += arr[i];
        res2 += arr[i + 1];
    }
    return res1 + res2;
}

void correlate(int ny, int nx, const float *data, float *result)
{
    // First normalize the input rows so that each row has the arithmetic mean of 0
    // Then normalize the input rows so that for each row the sum of the squares of the elements is 1

    int nv = (nx + (8 - 1)) / 8;
    int pad_index = nx % 8;
    float8_t *Xvec = float8_alloc(ny * nv);

    for (int y = 0; y < ny; y++)
    {
        // get average of this row
        float ave1 = 0;
        float ave2 = 0;
        for (int x = 0; x < nx; x += 2)
        {
            ave1 += data[x + y * nx];
            if (x + 1 < nx)
            {
                ave2 += data[x + 1 + y * nx];
            }
        }
        float ave = (ave1 + ave2) / nx;

        // get std of this row
        float std1 = 0;
        float std2 = 0;
        for (int x = 0; x < nx; x += 2)
        {
            std1 += pow((data[x + y * nx] - ave), 2);
            if (x + 1 < nx)
            {
                std2 += pow((data[x + 1 + y * nx] - ave), 2);
            }
        }
        float std = sqrt(std1 + std2);

// fill in Xvec of this row
#pragma omp parallel for
        for (int x = 0; x < nx - nx % 8; x += 8)
        {
            int offset = x / 8;
            Xvec[y * nv + offset] = float8_t{(data[x + y * nx] - ave) / std,
                                             (data[x + 1 + y * nx] - ave) / std,
                                             (data[x + 2 + y * nx] - ave) / std,
                                             (data[x + 3 + y * nx] - ave) / std,
                                             (data[x + 4 + y * nx] - ave) / std,
                                             (data[x + 5 + y * nx] - ave) / std,
                                             (data[x + 6 + y * nx] - ave) / std,
                                             (data[x + 7 + y * nx] - ave) / std};
        }
        for (int x = nx - nx % 8; x < nx; x++)
        {
            int offset = x / 8;
            Xvec[y * nv + offset][x % 8] = (data[x + y * nx] - ave) / std;
        }
    }
    // pad Xvec
    if (pad_index > 0)
    {
#pragma omp parallel for
        for (int row = nv - 1; row < ny * nv; row += nv)
        {
            for (int pad_idx = pad_index; pad_idx < 8; pad_idx++)
            {
                Xvec[row][pad_idx] = 0;
            }
        }
    }

    int s = 6; // kernel size s*s

    for (int r = 0; r < ny; r += s)
    {
#pragma omp parallel for
        for (int c = r; c < ny; c += s)
        {
            int j_up = std::min(r + s, ny);
            int i_up = std::min(c + s, ny);

            for (int j = r; j < j_up; j += 3)
            {
                for (int i = c; i < i_up; i += 3)
                {
                    float8_t temp00 = ZERO8;
                    float8_t temp01 = ZERO8;
                    float8_t temp02 = ZERO8;
                    float8_t temp10 = ZERO8;
                    float8_t temp11 = ZERO8;
                    float8_t temp12 = ZERO8;
                    float8_t temp20 = ZERO8;
                    float8_t temp21 = ZERO8;
                    float8_t temp22 = ZERO8;

                    for (int k = 0; k < nv; k++)
                    {
                        float8_t i0vec = Xvec[i * nv + k];
                        float8_t i1vec;
                        float8_t i2vec;
                        float8_t j0vec = Xvec[j * nv + k];
                        float8_t j1vec;
                        float8_t j2vec;

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
                    result[j * ny + i] = sum_float8(temp00);

                    if (i + 1 < i_up)
                    {
                        result[j * ny + i + 1] = sum_float8(temp01);
                    }
                    if (i + 2 < i_up)
                    {
                        result[j * ny + i + 2] = sum_float8(temp02);
                    }

                    if (j + 1 < j_up)
                    {
                        result[(j + 1) * ny + i] = sum_float8(temp10);

                        if (i + 1 < i_up)
                        {
                            result[(j + 1) * ny + i + 1] = sum_float8(temp11);
                        }
                        if (i + 2 < i_up)
                        {
                            result[(j + 1) * ny + i + 2] = sum_float8(temp12);
                        }
                    }
                    if (j + 2 < j_up)
                    {
                        result[(j + 2) * ny + i] = sum_float8(temp20);
                        if (i + 1 < i_up)
                        {
                            result[(j + 2) * ny + i + 1] = sum_float8(temp21);
                        }
                        if (i + 2 < i_up)
                        {
                            result[(j + 2) * ny + i + 2] = sum_float8(temp22);
                        }
                    }
                }
            }
        }
    }
    std::free(Xvec);
}
