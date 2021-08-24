puzzle_input <- read.delim("~/Documents/AoC/2020/04/puzzle_input.txt", sep="\r", header=FALSE,
                           blank.lines.skip = FALSE)

puzzle_input_formatted <- as.data.frame(matrix(data=NA, nrow=nrow(puzzle_input), ncol =1 ))
actual_lines <- c()

for (i in 1:nrow(puzzle_input)){
  if (puzzle_input[i,] != ''){
    actual_lines <- c(actual_lines, puzzle_input[i,])
  } else {
    puzzle_input_formatted[i,] <- paste(actual_lines, collapse = " ")
    actual_lines <- c()
  }
  
}

puzzle_input_clean <- na.omit(puzzle_input_formatted)

valid_ct <- 0
invalid_ct <- 0

expected_fields <- c('ecl','pid','eyr','hcl','byr','iyr','hgt')

for (i in 1:nrow(puzzle_input_clean)){
  # splititng at space, unlist, splitting at colon, select first from each list item, unlist
  current_keys <- unlist(lapply((strsplit(unlist(strsplit(puzzle_input_clean[i,], split = " ")), split = ":")),'[[',1))

  if (all(expected_fields %in% current_keys)){
    valid_ct <- valid_ct + 1
  } else {
    invalid_ct <- invalid_ct + 1
  }
}

