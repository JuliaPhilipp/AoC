# libraries

# input
test_input <- read.delim("~/Documents/AoC/2021/day01/input_test.txt", header = FALSE)
input <- read.delim("~/Documents/AoC/2021/day01/input.txt", header = FALSE)

# solution part I
bigger <- 0
smaller <- 0



for (i in 2:nrow(input)){
  k = i-1
  
  if (input[i,1] > input[k,1]){
    bigger <- bigger + 1
  } else if (input[i,1] < input[k,1]){
    smaller <- smaller + 1
  }
}

print(bigger)

# solution part II
bigger <- 0
smaller <- 0
no_change <- 0


for (i in 4:nrow(input)){
  k = i-2
  
  windowA <- sum(input[(i-1):(k-1),1])
  windowB <- sum(input[i:k,1])
  
  if (windowB > windowA){
    bigger <- bigger + 1
  } else if (windowB < windowA){
    smaller <- smaller + 1
  } else if (windowB == windowA){
    no_change <- no_change + 1
  }
  
}

print(bigger)