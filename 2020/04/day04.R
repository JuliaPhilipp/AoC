puzzle_input <- read.delim("~/Documents/AoC/2020/04/puzzle_input.txt", sep="\r", header=FALSE,
                           blank.lines.skip = FALSE)

#puzzle_input <- read.delim("~/Documents/AoC/2020/04/puzzle_input_test.txt", sep="\r", header=FALSE,
#                           blank.lines.skip = FALSE)

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

print(valid_ct)
print(invalid_ct)

  
  

## PART 2

# function to read in passport data line into named list
read_in <- function(x){
  line <- unlist(strsplit(x, split = " "))
  data_vt <- lapply(strsplit(line,split = ":"),'[[',2)
  names(data_vt) <- lapply(strsplit(line,split = ":"),'[[',1)
  
  # returns named list
  return(data_vt)
}

# function to check validity of all passport fields
check_valid <- function(x){
  # use named list returned by read_in
  test_vector <- c()
  
  # test birth year
  if (as.integer(x$byr) >= 1920 && as.integer(x$byr) <= 2002 ){
    test_vector <- c(test_vector, TRUE)
  } else {
    test_vector <- c(test_vector, FALSE)
  }
  
  # test issue year
  if (as.integer(x$iyr) >= 2010 && as.integer(x$iyr) <= 2020){
    test_vector <- c(test_vector, TRUE)
  } else {
    test_vector <- c(test_vector, FALSE)
  }
  
  # test expiration year
  if (as.integer(x$eyr) >= 2020 && as.integer(x$eyr) <= 2030){
    test_vector <- c(test_vector, TRUE)
  } else {
    test_vector <- c(test_vector, FALSE)
  }
  
  # check height
  if (grepl("cm", x$hgt)){
    # check height in cm
    height <- unlist(strsplit(x$hgt, split = "c"))[1]
    if (as.integer(height) >= 150 && as.integer(height) <= 193){
      test_vector <- c(test_vector, TRUE)
    } else{
      test_vector <- c(test_vector, FALSE)
    }
  } else if (grepl("in", x$hgt)){
    # check heigh in in
    height <- unlist(strsplit(x$hgt, split = "i"))[1]
    if (as.integer(height) >= 59 && as.integer(height) <= 76){
      test_vector <- c(test_vector, TRUE)
    } else {
      test_vector <- FALSE
    }
  } else {
    test_vector <- c(test_vector, FALSE)
  }
  
  # check haircolor
  if (grepl("#", x$hcl) && nchar(x$hcl) == 7){
    test_vector <- c(test_vector, TRUE)
  } else {
    test_vector <- c(test_vector, FALSE)
  }
  
  # check eyecolor
  accepted_eyecolors <- c("amb","blu","brn","gry","grn","hzl","oth")
  if (x$ecl %in% accepted_eyecolors){
    test_vector <- c(test_vector, TRUE)
  } else {
    test_vector <- c(test_vector, FALSE)
  }
  # check passport ID
  if (nchar(x$pid) == 9 && str_detect(x$pid, "^[:digit:]+$")){
    test_vector <- c(test_vector, TRUE)
  } else{
    test_vector <- c(test_vector, FALSE)
  }
  
  return(all(test_vector))
}


valid_ct <- 0
invalid_ct <- 0

for (i in 1:nrow(puzzle_input_clean)){
  # splititng at space, unlist, splitting at colon, select first from each list item, unlist
  current_keys <- unlist(lapply((strsplit(unlist(strsplit(puzzle_input_clean[i,], split = " ")), split = ":")),'[[',1))
  
  if (all(expected_fields %in% current_keys)){
    test_line <- read_in(puzzle_input_clean[i,])
    # add data validation here
    if (check_valid(test_line)){
      valid_ct <- valid_ct + 1
    } else {
      invalid_ct <- invalid_ct + 1
    }
    
  } else {
    invalid_ct <- invalid_ct + 1
  }
}