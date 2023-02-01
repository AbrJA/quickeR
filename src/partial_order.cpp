#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
IntegerVector partial_order_cpp(NumericVector x, int n) {
  IntegerVector y(x.size());
  std::iota(y.begin(), y.end(), 0);
  std::partial_sort(y.begin(), y.begin() + n, y.end(),
                    [&](int i, int j) {
                      return x[i] < x[j];
                    });
  return y + 1;
}
