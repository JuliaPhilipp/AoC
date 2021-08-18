library(stringr)

puzzle_input <- read.delim("~/Documents/AoC/2020/2/puzzle_input.txt", header = FALSE, sep=":")


## PART 1

true_ct <- 0
false_ct <- 0

for (i in 1:nrow(puzzle_input)){
  # split strings to get min, max, and letter
  min <- as.integer(unlist(strsplit(puzzle_input[i,"V1"], split = "-"))[1])
  max <- as.integer(unlist(strsplit(puzzle_input[i,"V1"], split = "[- ]"))[2])
  letter <- unlist(strsplit(puzzle_input[i,"V1"], split = "[ ]"))[2]
  pw <- puzzle_input[i,"V2"]
  
  
  # test each row for conditions
  if ( str_count(pw, letter) >= min & str_count(pw, letter) <= max){
    true_ct <- true_ct + 1
  } else {
    false_ct <- false_ct + 1
  }
}

print(true_ct)
print(false_ct)

## PART 2

true_ct <- 0
false_ct <- 0

for (i in 1:nrow(puzzle_input)){
  # split strings to get min, max, and letter
  pos1 <- as.integer(unlist(strsplit(puzzle_input[i,"V1"], split = "-"))[1])
  pos2 <- as.integer(unlist(strsplit(puzzle_input[i,"V1"], split = "[- ]"))[2])
  letter <- unlist(strsplit(puzzle_input[i,"V1"], split = "[ ]"))[2]
  pw <- str_trim(puzzle_input[i,"V2"], side = "both")
  
  
  # test each row for conditions
  # test for exactly one condition being true, not both
  # xor() exactly one is true
  if ( xor(substr(pw, pos1, pos1) == letter,substr(pw, pos2,pos2) == letter) ){
    true_ct <- true_ct + 1
  } else {
    false_ct <- false_ct + 1
  }
}

print(true_ct)
print(false_ct)