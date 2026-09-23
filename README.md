
# lab3algorithms

<!-- badges: start -->
[![R-CMD-check](https://github.com/balascode/lab3algorithms/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/balascode/lab3algorithms/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## About

An R package implementing the Euclidean algorithm and Dijkstra's shortest-path algorithm for Advanced R Programming (732A94), Linköping University.

## Authors

- Venkata Balaji Anupoju
- Marwan Karim

## Functions

### euclidean()

Calculates the greatest common divisor of two numbers using the Euclidean algorithm.

### dijkstra()

Calculates the shortest distances from a starting node to all other nodes in a weighted graph.

## Example

```r
library(lab3algorithms)

euclidean(48, 18)

dijkstra(wiki_graph, 1)
```

## Testing

The package includes unit tests using testthat.
