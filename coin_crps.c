#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>


const int Ncases = 20;          // number of independent experiments
const int Nsamples = 100;       // number of coin flips per experiment
const double p_heads = 0.51;    // probability of heads

// Define arrays for the results:
double frac_heads_array[Ncases];
double crps_1[Ncases];
double crps_2[Ncases][Ncases];


// Helper functions to calculate the mean of a 2D and 1D array:
double mean_2d(double arr[][Ncases], int Ncases) {
    double sum = 0.0;
    for (int i = 0; i < Ncases; ++i)
        for (int j = 0; j < Ncases; ++j)
            sum += arr[i][j];
    return sum / (Ncases * Ncases);
}

double mean_1d(double *arr, int Ncases) {
    double sum = 0.0;
    for (int i = 0; i < Ncases; ++i)
        sum += arr[i];
    return sum / Ncases;
}


int main(void) {


    //srand(12345);                   // fixed seed; change to time(NULL) for randomness
    srand(time(NULL));
    //printf("Random seed: %d\n", time(NULL));


    // First loop to generate the results with random numbers:

    for (int c = 0; c < Ncases; ++c) {
        int heads = 0;

        double crps_1 = 0.0;
        double crps_2 = 0.0;

        for (int i = 0; i < Nsamples; ++i) {
            double u = (double)rand() / (double)RAND_MAX; // uniform [0,1)
            if (u < p_heads)
                heads++;
        }

        frac_heads_array[c] = (double)heads / (double)Nsamples;
        //double frac_heads = (double)heads / (double)Nsamples;
        printf("Case %2d: fraction of heads = %.4f\n", c + 1, frac_heads_array[c]);

    }

    // Second loop to calculate the CRPS terms:

    for (int c = 0; c < Ncases; ++c) {

    crps_1[c] = fabs(frac_heads_array[c] - p_heads);
    printf("CRPS_1[%d] = %.4f\n", c, crps_1[c]);
    
    for (int d = 0; d < Ncases; ++d) {
        crps_2[c][d] = fabs(frac_heads_array[c] - frac_heads_array[d]);
        printf("CRPS_2[%d][%d] = %.4f\n", c, d, crps_2[c][d]);
    }

    }

    double mean_crps_1 = mean_1d(crps_1, Ncases);
    double mean_crps_2 = mean_2d(crps_2, Ncases);
    printf("Mean CRPS_1 = %.4f\n", mean_crps_1);
    printf("Mean CRPS_2 = %.4f\n", mean_crps_2);

    return 0;
}
