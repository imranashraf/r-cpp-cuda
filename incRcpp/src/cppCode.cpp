#include <Rcpp.h>
using namespace Rcpp;

extern "C"
void cudaCall(double *A, int n);


// [[Rcpp::export]]
NumericVector cppCall(NumericVector x)
{
    std::cout << "Halo van CPP\n";
    int n = x.size();
    double * y = new double[n];
    
    for(int i=0; i<n; i++)
        y[i] = x[i];

    cudaCall(y, n);

    NumericVector z(n);
    for(int i=0; i<n; i++)
        z[i] = y[i];

    return z;
}
