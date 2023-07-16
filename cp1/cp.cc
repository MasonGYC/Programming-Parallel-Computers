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
void correlate(int ny, int nx, const float *data, float *result)
{
    // First normalize the input rows so that each row has the arithmetic mean of 0
    // Then normalize the input rows so that for each row the sum of the squares of the elements is 1

    std::vector<double> X(nx * ny);
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

        // fill in X of this row
        for (int x = 0; x < nx; x++)
        {
            X[x + y * nx] = (double)(data[x + y * nx] - ave) / std;
        }
    }

    // Calculate the (upper triangle of the) matrix product Y = XXT.
    // store in result
    for (int y = 0; y < ny; y++)
    {
        for (int x = y; x < ny; x++)
        {
            double temp = 0;
            for (int k = 0; k < nx; k++)
            {
                temp += X[k + y * nx] * X[k + x * nx];
            }
            result[y * ny + x] = float(temp);
        }
    }
}
