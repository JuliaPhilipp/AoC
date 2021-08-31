puzzle_input <- read.delim("~/Documents/AoC/2020/05/puzzle_input.txt", sep="", header=FALSE)

upper <- function(x){
  # integer div
  div <- length(x)%/%2
  new_min <- div+1
  new <- x[new_min:length(x)]
  
  return(new)
}

lower <- function(x){
  div <- length(x)%/%2
  new_max <- div
  new <- x[1:new_max]
  
  return(new)
}


all_seat_ids <- c()

for (i in 1:nrow(puzzle_input)){
  current_string <- unlist(strsplit(puzzle_input[i,], split = ""))
  #current_string <- unlist(strsplit(test, split = ""))
  # get row
  current_row <- c(0:127)
  for (k in 1:7){
    if (current_string[k] == "F"){
      current_row <- lower(current_row)
    } else if (current_string[k] == "B"){
      current_row <- upper(current_row)
    }
  }
  # get column
  current_column <- c(0:7)
  for (k in 8:10){
    if (current_string[k] == "L"){
      current_column <- lower(current_column)
    } else if (current_string[k] == "R"){
      current_column <- upper(current_column)
    }
  }
    # unique seat id
    current_seat_id <- current_row * 8 + current_column
  
    all_seat_ids <- c(all_seat_ids, current_seat_id)
}

max(all_seat_ids)


# part 2

# all seats in the airplane
available_seat_ids <- c(min(all_seat_ids):max(all_seat_ids))

# which are not taken (e.g. which are not in vector all_Seat_ids)
available_seat_ids[which(!available_seat_ids %in% all_seat_ids)]
