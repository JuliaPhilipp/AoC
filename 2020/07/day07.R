library(igraph)
library(DiagrammeR)

puzzle_input <- read.delim("~/Documents/AoC/2020/07/puzzle_input.txt", sep="\t", header=FALSE)

rules <- list()
#rules <- data.frame()
for (i in 1:nrow(puzzle_input)){
  words <- unlist(strsplit(puzzle_input[i,], split = " "))
  parent <- paste0(words[1],words[2])
  k = 6
  while (k < length(words)){
    child <- paste0(words[k], words[k+1])
    rules[[length(rules)+1]] <- c(parent, child)
    k <- k +4
  }
}

g1 <- make_graph(unlist(rules))

shortenodes <-
  create_node_df(n = 595,
                 label = unique(c(rules$V1, rules$V2)))

edges <- 
  create_edge_df(
    from = rules$V1,
    to = rules$V2,
    rel = "related")
g2 <- create_graph(n = 1465,
                   edges_df = rules,
                   graph_attrs = "layout = neato",
                   node_attrs = "fontname = Helvetica",
                   edge_attrs = "color = gray20")
get_paths(g1, "shinygold")
