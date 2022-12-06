# Day 2
# Part 1
library(tidyverse)

input <- read.delim("~/Documents/AoC/2022/day02/input.txt", sep = "", header = FALSE)

combinations <- expand.grid(x=LETTERS[1:3], y=LETTERS[24:26]) %>% cbind()

score_sheet_winning <- data.frame(matrix(data = NA, nrow = 9, ncol = 3))
score_sheet_winning[,1] <- paste0(combinations$x, combinations$y)
score_sheet_winning[,2] <- c("draw","loss","win","win","draw","loss","loss","win","draw")
score_sheet_winning[,3] <- c(3,0,6,6,3,0,0,6,3)

score_sheet_shape <- data.frame(matrix(data = NA, nrow=3, ncol=2))
score_sheet_shape[1,] <- c("X", 1)
score_sheet_shape[2,] <- c("Y", 2)
score_sheet_shape[3,] <- c("Z", 3)
colnames(score_sheet_shape) <- c("shape", "score")

score_rounds <- c()
for (i in 1:nrow(input)){
  game <- paste0(input[i,1],input[i,2])
  my_shape <- input[i,2]
  score_winning <- score_sheet_winning[which(score_sheet_winning$X1 == game), 3]
  score_shape <- score_sheet_shape[which(score_sheet_shape$shape == my_shape),2]
  score_round <- score_winning + as.integer(score_shape)
  score_rounds[i] <- score_round
}

total_score <- sum(score_rounds)

## Part 2
combinations <- expand.grid(x=LETTERS[1:3], y=LETTERS[1:3]) %>% cbind()


score_sheet_winning <- data.frame(matrix(data = NA, nrow = 9, ncol = 3))
score_sheet_winning[,1] <- combinations$x
score_sheet_winning[,2] <- combinations$y
score_sheet_winning[,3] <- c("Y","X","Z","Z","Y","X","X","Z","Y")
score_sheet_winning[,4] <- c("draw","loss","win","win","draw","loss","loss","win","draw")
score_sheet_winning[,5] <- c(3,0,6,6,3,0,0,6,3)

score_sheet_shape <- data.frame(matrix(data = NA, nrow=3, ncol=2))
score_sheet_shape[1,] <- c("A", 1)
score_sheet_shape[2,] <- c("B", 2)
score_sheet_shape[3,] <- c("C", 3)
colnames(score_sheet_shape) <- c("shape", "score")


score_rounds <- c()
for (i in 1:nrow(input)){
  their_shape <- input[i,1]
  game_outcome <- input[i,2]
  my_shape <- score_sheet_winning[which(score_sheet_winning$X1 == their_shape & score_sheet_winning$X3 == game_outcome),2]
  score_winning <- score_sheet_winning[which(score_sheet_winning$X1 == their_shape & score_sheet_winning$X3 == game_outcome),5]
  score_shape <- score_sheet_shape[which(score_sheet_shape$shape == my_shape),2]
  score_round <- score_winning + as.integer(score_shape)
  score_rounds[i] <- score_round
}

total_score <- sum(score_rounds)
