#include <algorithm>
#include <iostream>
#include <vector>
#include <omp.h>
#include <cmath>

typedef unsigned long long data_t;

using namespace std;

void psort(int n, data_t *data) {
    // FIXME: Implement a more efficient parallel sorting algorithm for the CPU,
    // using the basic idea of quicksort.
    
    if (n > 0)
    {
        // split into NUM_THREADS*(n/NUM_THREADS) blocks
        int log2_max_threads = log2((double)omp_get_max_threads());
        int num_blocks = pow(2, log2_max_threads); // NUM_THREADS
        int block_size = (n + num_blocks - 1) / num_blocks;

        // if one thread is enough, use sort
        if (n < 5)
        {
            sort(data, data + n);
        }
        else
        {
            // mergesort each blocks
            omp_set_dynamic(0);
#pragma omp parallel num_threads(num_blocks)
            {
                int t = omp_get_thread_num();
                int span = t * block_size;
                sort(data + min(span, n), data + min(span + block_size, n));
            }

            // merge all blocks
            num_blocks /= 2;
            while (num_blocks > 0)
            {
#pragma omp parallel num_threads(num_blocks)
                {
                    int t = omp_get_thread_num() * 2;
                    int span = t * block_size;
                    inplace_merge(data + min(span, n),
                                  data + min(span + block_size, n),
                                  data + min(span + 2 * block_size, n));
                }
                block_size *= 2; // 1,2,4
                num_blocks /= 2; // 4,2,1
            };
        }
    }
}
