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

__global__ void myppkernel(float *dataGPU, int ny, int nx, int nn)
{
    // pad ny to be nn
    // nn: multiple of 64
    int ja = threadIdx.x; // col % 64
    int i = blockIdx.y;   // row, 1 block 1 row

    for (int jb = 0; jb < nx; jb += 64)
    {
        int j = jb + ja;
        if (j < nx && i >= ny)
        {
            dataGPU[j + i * nx] = 0;
        }
    }
}

__global__ void myNormkernel(float *data, float *normedGPU, int ny, int nx)
{
    // First normalize the input rows so that each row has the arithmetic mean of 0
    // Then normalize the input rows so that for each row the sum of the squares of the elements is 1

    int ja = threadIdx.x; // col % 64
    int i = blockIdx.y;   // row, 1 block 1 row

    int y = i * 64 + ja;
    if (y < ny)
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
            normedGPU[x + y * nx] = (data[x + y * nx] - ave) / std;
        }
    }
}

__global__ void mykernel(float *resGPU, float *dataGPU, int ny, int nx, int nn)
{
    int thread_x = threadIdx.x; // x: col
    int thread_y = threadIdx.y; // y: row
    int block_x = blockIdx.x;
    int block_y = blockIdx.y;

    if (block_x < block_y)
    {
        for (int ib = 0; ib < 8; ++ib)
        {
            for (int jb = 0; jb < 8; ++jb)
            {
                int i = block_y * 64 + ib * 8 + thread_y;
                int j = block_x * 64 + jb * 8 + thread_x;
                if (i < ny && j < ny)
                {
                    resGPU[j + i * ny] = 0;
                }
            }
        }
    }
    else
    {
        float v[8][8] = {0}; // store result of row i * j
        const int size = 6;

        // loop all elements in a row
        for (int k = 0; k < nx; k += size)
        {
            float x[8][size];
            float y[8][size];

            for (int ib = 0; ib < 8; ++ib)
            {
                int i = block_y * 64 + ib * 8 + thread_y;
                for (int m = 0; m < size; m++)
                {
                    y[ib][m] = (k + m < nx) ? dataGPU[k + m + i * nx] : 0;
                }
            }
            for (int jb = 0; jb < 8; ++jb)
            {
                int j = block_x * 64 + jb * 8 + thread_x;
                for (int m = 0; m < size; m++)
                {
                    x[jb][m] = (k + m < nx) ? dataGPU[k + m + j * nx] : 0;
                }
            }
            for (int ib = 0; ib < 8; ++ib)
            {
                for (int jb = 0; jb < 8; ++jb)
                {
                    for (int m = 0; m < size; m++)
                    {
                        v[ib][jb] += y[ib][m] * x[jb][m];
                    }
                }
            }
        }
        for (int ib = 0; ib < 8; ++ib)
        {
            for (int jb = 0; jb < 8; ++jb)
            {
                int i = block_y * 64 + ib * 8 + thread_y;
                int j = block_x * 64 + jb * 8 + thread_x;
                if (i < ny && j < ny)
                {
                    resGPU[j + i * ny] = v[ib][jb];
                }
            }
        }
    }
}

void correlate(int ny, int nx, const float *data, float *result)
{

    int nn = roundup(ny, 64);
    int original_size = ny * nx * sizeof(float);

    float *rawGPU = NULL;
    CHECK(cudaMalloc((void **)&rawGPU, original_size));
    float *dataGPU = NULL;
    CHECK(cudaMalloc((void **)&dataGPU, nn * nx * sizeof(float)));
    float *resGPU = NULL;
    CHECK(cudaMalloc((void **)&resGPU, ny * ny * sizeof(float)));
    CHECK(cudaMemcpy(rawGPU, data, original_size, cudaMemcpyHostToDevice));

    // Run normalization kernel
    {
        dim3 dimBlock(64, 1);
        dim3 dimGrid(1, nn / 64);
        myNormkernel<<<dimGrid, dimBlock>>>(rawGPU, dataGPU, ny, nx);
        // CHECK(cudaDeviceSynchronize());
        CHECK(cudaGetLastError());
    }

    // Run padding kernel
    {
        dim3 dimBlock(64, 1);
        dim3 dimGrid(1, nn);
        myppkernel<<<dimGrid, dimBlock>>>(dataGPU, ny, nx, nn);
        // CHECK(cudaDeviceSynchronize());
        CHECK(cudaGetLastError());
    }

    // Run kernel
    {
        dim3 dimBlock(8, 8);
        dim3 dimGrid(nn / 64, nn / 64);
        mykernel<<<dimGrid, dimBlock>>>(resGPU, dataGPU, ny, nx, nn);
        // CHECK(cudaDeviceSynchronize());
        CHECK(cudaGetLastError());
    }

    // Copy data back to CPU & release memory
    CHECK(cudaMemcpy(result, resGPU, ny * ny * sizeof(float), cudaMemcpyDeviceToHost));
    CHECK(cudaFree(dataGPU));
    CHECK(cudaFree(resGPU));
    CHECK(cudaFree(rawGPU));
}