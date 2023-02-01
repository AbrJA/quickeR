#' @importFrom Rcpp sourceCpp
#' @useDynLib quickeR
#' @title Partial order
#' @description function to order partially a numeric vector.
#' @param x numeric vector.
#' @param n integer.
#' @param decreasing logical.
#'
#' @return integer vector.
#' @export
#'
#' @examples
#' set.seed(1L)
#' x <- sample.int(10, 5)
#' x[partial_order(x, 3)]

partial_order <- function(x, n = length(x), decreasing = FALSE) {
  if (!is.logical(decreasing) || length(decreasing) != 1L)
    stop("'decreasing' must be a length-1 logical vector.")
  if (!all.equal(n, as.integer(n)) || length(n) != 1L || n < 1L || n > length(x))
    stop("'n' must be a length-1 integer vector between 1 and length(x)")
  if (decreasing)
    return(partial_order_cpp(-x, n))
  return(partial_order_cpp(x, n))
}
