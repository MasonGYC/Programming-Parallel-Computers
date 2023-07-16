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
#include <cstdlib>
#include <iostream>
#include <cuda_runtime.h>

static inline void check(cudaError_t err, const char *context)
{
    if (err != cudaSuccess)
    {
        std::cerr << "CUDA error: " << context << ": "
                  << cudaGetErrorString(err) << std::endl;
        std::exit(EXIT_FAILURE);
    }
}

#define CHECK(x) check(x, #x)

static inline int divup(int a, int b)
{
    return (a + b - 1) / b;
}

static inline int roundup(int a, int b)
{
    return divup(a, b) * b;
}

__global__ void mykernel(float *resGPU, float *dataGPU, int ny, int nx)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x; // i: row, small ; blockDim.x = 16
    int j = threadIdx.y + blockIdx.y * blockDim.y; // j: col, big ; blockDim.y = 16
    // What if n is not a multiple of 16
    if (i >= ny || j >= ny)
        return;

    // Calculate the (upper triangle of the) matrix product Y = XXT.
    // store in result
    float temp = 0;
    for (int k = 0; k < nx; k++)
    {
        temp += dataGPU[k + i * nx] * dataGPU[k + j * nx];
    }
    resGPU[i * ny + j] = float(temp);
    // for (int y = 0; y < ny; y++)
    // {
    //     for (int x = y; x < ny; x++)
    //     {
    //         float temp = 0;
    //         for (int k = 0; k < nx; k++)
    //         {
    //             temp += dataGPU[k + y * nx] * dataGPU[k + x * nx];
    //         }
    //         resGPU[y * ny + x] = float(temp);
    //     }
    // }
}

void correlate(int ny, int nx, const float *data, float *result)
{
    // First normalize the input rows so that each row has the arithmetic mean of 0
    // Then normalize the input rows so that for each row the sum of the squares of the elements is 1

    float *X = (float *)malloc(sizeof(float) * ny * nx);
    for (int y = 0; y < ny; y++)
    {
        // get average of this row
        float ave = 0;
        for (int x = 0; x < nx; x++)
        {
            ave += data[x + y * nx];
        }
        ave = ave / nx;

        // get std of this row
        float std = 0;
        for (int x = 0; x < nx; x++)
        {
            std += pow((data[x + y * nx] - ave), 2);
        }
        std = sqrt(std);

        // fill in X of this row
        for (int x = 0; x < nx; x++)
        {
            X[x + y * nx] = (data[x + y * nx] - ave) / std;
        }
    }

    float *dataGPU = NULL;
    CHECK(cudaMalloc((void **)&dataGPU, nx * ny * sizeof(float)));
    float *resGPU = NULL;
    CHECK(cudaMalloc((void **)&resGPU, ny * ny * sizeof(float)));
    CHECK(cudaMemcpy(dataGPU, X, nx * ny * sizeof(float), cudaMemcpyHostToDevice));

    // Run kernel
    dim3 dimBlock(16, 16);
    dim3 dimGrid(divup(ny, dimBlock.x), divup(ny, dimBlock.y));
    mykernel<<<dimGrid, dimBlock>>>(resGPU, dataGPU, ny, nx);
    CHECK(cudaDeviceSynchronize());
    CHECK(cudaGetLastError());

    // Copy data back to CPU & release memory
    CHECK(cudaMemcpy(result, resGPU, ny * ny * sizeof(float), cudaMemcpyDeviceToHost));
    CHECK(cudaFree(dataGPU));
    CHECK(cudaFree(resGPU));

    free(X);
}
