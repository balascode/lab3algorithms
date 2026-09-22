#' Euclidean Algorithm
#'
#' Computes the greatest common divisor of two numbers
#' using the Euclidean algorithm.
#'
#' @param a A numeric scalar.
#' @param b A numeric scalar.
#'
#' @return The greatest common divisor of a and b.
#'
#' @references
#' https://en.wikipedia.org/wiki/Euclidean_algorithm
#'
#' @export

euclidean <- function(a, b) {
  if(!(is.numeric(a) && length(a) == 1 &&
      is.numeric(b) && length(b) == 1)){
    stop()
  }
  while (b != 0) {
    t <- b
    b <- a %% b
    a <- t
  }

  return(a)
}
