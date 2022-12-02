# DAY 1

# Part 1
input <- "~/Documents/AoC/2022/day01/test_input.txt"
input <- "~/Documents/AoC/2022/day01/input.txt"
l <- readLines(input)

list_of_elves <- list()


k = 1
calories_sum = 0
for (i in 1:length(l)){
  if (l[i] == ""){
    list_of_elves[[k]] <- calories_sum
    calories_sum = 0
    k = k + 1
  } else{
    calories_sum = calories_sum + as.integer(l[i])
  }

vector_of_elves <- unlist(list_of_elves)
max_calories <- max(vector_of_elves)
which_elve <- which(vector_of_elves == max_calories)

# Part 2
# find the top three elves
top_3_calories <- sum(sort(vector_of_elves, decreasing = TRUE)[1:3])
