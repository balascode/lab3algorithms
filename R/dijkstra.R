#' Dijkstra's Algorithm
#'
#' Computes the shortest path distances from a starting node
#' to all other nodes in a weighted graph using Dijkstra's algorithm.
#' Check that all edge weights are present and non-negative.
#'
#' @param graph A data.frame with columns v1, v2, and w, representing
#'   the edges and their weights.
#' @param init_node A numeric scalar indicating the starting node.
#'
#'
#' @return A numeric vector containing the shortest distance from
#'   init_node to every node in the graph.
#'
#' @references
#' https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm
#'
#' @export

dijkstra <- function(graph, init_node) {

  if (!is.data.frame(graph) ||
      ncol(graph) != 3 ||
      !all(c("v1", "v2", "w") %in% names(graph))) {
    stop()
  }

  if (any(is.na(graph$w)) || any(graph$w < 0)) {
    stop("Weights must be non-negative and not NA.")
  }

  if (!(is.numeric(init_node) && length(init_node) == 1)) {
    stop()
  }

  nodes <- sort(unique(c(graph$v1, graph$v2)))

  if (!(init_node %in% nodes)) {
    stop()
  }

  distances <- rep(Inf, length(nodes))
  names(distances) <- nodes

  distances[as.character(init_node)] <- 0

  visited <- rep(FALSE, length(nodes))
  names(visited) <- nodes
  while (any(!visited)) {

    temp_distances <- distances
    temp_distances[visited] <- Inf

    current_index <- which.min(temp_distances)

    if (is.infinite(temp_distances[current_index])) {
      break
    }

    current <- nodes[current_index]

    edges <- graph[graph$v1 == current, ]

    for (i in seq_len(nrow(edges))) {

      neighbour <- edges$v2[i]

      new_distance <-
        distances[as.character(current)] + edges$w[i]

      if (new_distance < distances[as.character(neighbour)]) {
        distances[as.character(neighbour)] <- new_distance
      }
    }

    visited[as.character(current)] <- TRUE
  }

  return(unname(distances))
}

wiki_graph <-
  data.frame(v1=c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
             v2=c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
             w=c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9))
dijkstra(wiki_graph, 1)
