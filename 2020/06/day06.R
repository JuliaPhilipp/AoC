library(stringr)

puzzle_input <- read.delim("~/Documents/AoC/2020/06/puzzle_input.txt", sep="\r", header=FALSE,
                           blank.lines.skip = FALSE)

test <- scan("~/Documents/AoC/2020/06/puzzle_input.txt", what="", sep="\n")


puzzle_input_formatted <- as.data.frame(matrix(data=NA, nrow=nrow(puzzle_input), ncol =1 ))
actual_lines <- c()

for (i in 1:nrow(puzzle_input)){
  if (puzzle_input[i,] != ''){
    actual_lines <- c(actual_lines, puzzle_input[i,])
  } else {
    # this won't happen for the last line of the file
    # need extra statement
    puzzle_input_formatted[i,] <- paste(actual_lines, collapse = " ")
    actual_lines <- c()
  }
  if (i == nrow(puzzle_input)){
    # for last line of file (no blank after)
    puzzle_input_formatted[i,] <- paste(actual_lines, collapse = " ")
  }
}

puzzle_input_clean <- na.omit(puzzle_input_formatted)


uniqchars <- function(x) length(unique(strsplit(gsub(" ","",x), "")[[1]]))

questions <- c()

sum_chars <- 0

for (i in 1:nrow(puzzle_input_clean)){
  questions <- c(questions, uniqchars(puzzle_input_clean[i,]))
  sum_chars <- sum_chars + uniqchars(puzzle_input_clean[i,])
}

sum(questions)

# Part II

# number of members in group
n_members <- function(x) sapply(strsplit(x, " "), length)


# count letters in string (after whitespace removed)
count_letters <- function(x) table(unlist(strsplit(gsub(" ","", x), "")))

questions <- 0

for (i in 1:nrow(puzzle_input_clean)){
  
  letter_table <- count_letters(puzzle_input_clean[i,])
  group_members <- n_members(puzzle_input_clean[i,])
  
  questions_all_yes <- length(which(letter_table == group_members))
  questions <- questions + questions_all_yes
  
}