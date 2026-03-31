#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void) {
    const int N = 1000000;

    int a = 0;    
    int *b = (int *)malloc(N * sizeof *b);
    if (!b) { perror("malloc"); return 1; }
    for (int i = 0; i < N; i++) b[i] = 1;

    clock_t start, end;

    // Count loop 
    start = clock();
    for (int j = 0; j < N; j++) a += 1;
    end = clock();
    printf("Loop time: %f sec (a=%d)\n",
           (double)(end - start) / CLOCKS_PER_SEC, a);

    int sum = 0;
    start = clock();
    for (int j = 0; j < N; j++) sum += b[j];
    end = clock();
    printf("Sum time: %f sec (sum=%d)\n",
           (double)(end - start) / CLOCKS_PER_SEC, sum);

    free(b);
    return 0;
}
