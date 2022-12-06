# Day3

## Part 1

input <- read.delim("~/Documents/AoC/2022/day03/test_input.txt", sep = "", header = FALSE)

overlap_vector <- c()

for (i in 1:nrow(input)){
  string <- unlist(strsplit(input[i,], split=""))
  n_items <-length(string)
  compartmentA <- string[1:(n_items/2)]
  compartmentB <- string[((n_items/2)+1):n_items]
  overlap <- intersect(compartmentA, compartmentB)
  overlap_vector <- append(overlap_vector, overlap)
}

priorities <- data.frame(matrix(data = NA, nrow=52, ncol=2))
priorities$X1 <- c(letters, LETTERS)
priorities$X2 <- c(1:52)

#calculate priorities
sum_priorities <- 0

for (i in 1:length(overlap_vector)){
  current_prior <- priorities[which(priorities$X1 == overlap_vector[i]),"X2"]
  sum_priorities <- sum_priorities + current_prior
}


## Part II

# groups of three and identify the overlap
overlap_vector <- c()

for (i in seq(1, nrow(input), by =3)){
  string1 <- unlist(strsplit(input[i,], split=""))
  string2 <- unlist(strsplit(input[i+1,], split=""))
  string3 <- unlist(strsplit(input[i+2,], split=""))
  
  overlap <- intersect(intersect(string1, string2), string3)
  overlap_vector <- append(overlap_vector, overlap)
}