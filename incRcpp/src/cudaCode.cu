#include <cmath>
#include <stdio.h>
#include <cuda.h>
// #include "cuda_runtime.h"

__global__ void
vectorInc(double *A, int numElements)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if(i < numElements)
    {
        A[i] = A[i] + 1;
    }
}

extern "C"
void cudaCall(double *A, int n)
{
    printf("Halo van CUDA\n");

    // Device Memory
    double *d_A;
    // Define the execution configuration
    dim3 blockSize(256,1,1);
    dim3 gridSize(1,1,1);
    gridSize.x = (n + blockSize.x - 1) / blockSize.x;

    // Allocate output array
    cudaMalloc((void**)&d_A, n * sizeof(double));

    // Copy data to device
    cudaMemcpy(d_A, A, n * sizeof(double), cudaMemcpyHostToDevice);

    // Call the kernel
    vectorInc<<<gridSize,blockSize>>>(d_A, n);

    // Copy output from device to host
    cudaMemcpy(A, d_A, n * sizeof(double), cudaMemcpyDeviceToHost);

    // Free device memory
    cudaFree(d_A);
}
