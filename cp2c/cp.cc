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

void correlate(int ny, int nx, const float *data, float *result)
{
    // First normalize the input rows so that each row has the arithmetic mean of 0
    // Then normalize the input rows so that for each row the sum of the squares of the elements is 1

    int nv = (nx + 3) / 4;
    int pad_index = nx % 4;
    std::vector<double> X(nx * ny);
    double4_t *Xvec = double4_alloc(ny * nv);

    for (int y = 0; y < ny; y++)
    {
        // get average of this row
        double ave = 0;
        for (int x = 0; x < nx; x++)
        {
            ave += (double)data[x + y * nx];
        }
        ave = ave / nx;

        // get std of this row
        double std = 0;
        for (int x = 0; x < nx; x++)
        {
            std += (double)pow((data[x + y * nx] - ave), 2);
        }
        std = sqrt(std);

        // fill in Xvec of this row
        for (int x = 0; x < nx; x++)
        {
            // X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
            int offset = x / 4;
            Xvec[y * nv + offset][x % 4] = (double)(data[x + y * nx] - ave) / std;
            ;
        }

        // pad Xvec
        if (pad_index > 0)
        {
            for (int row = nv - 1; row < ny; row += nv)
            {
                for (int pad_idx = pad_index; pad_idx < 4; pad_idx++)
                {
                    Xvec[row][pad_idx] = (double)0;
                }
            }
        }
    }

    // Calculate the (upper triangle of the) matrix product Y = XXT.
    // store in result
    for (int j = 0; j < ny; j++)
    {
        for (int i = j; i < ny; i++)
        {
            double4_t temp = {0, 0, 0, 0};
            double res = 0;
            // dot product of 2 rows
            for (int k = 0; k < nv; k++)
            {
                int i_idx = i * nv + k;
                int j_idx = j * nv + k;
                temp += Xvec[j_idx] * Xvec[i_idx];
            }
            // sum all products
            for (int m = 0; m < 4; m++)
            {
                res += temp[m];
            }
            result[j * ny + i] = float(res);
        }
    }
    std::free(Xvec);
}
