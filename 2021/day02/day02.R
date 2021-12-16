# libraries

# input
test_input <- read.delim("~/Documents/AoC/2021/day02/input_test.txt", header = FALSE, sep = " ")
input <- read.delim("~/Documents/AoC/2021/day02/input.txt", header = FALSE, sep = " ")


# solution part I

summary <- input %>% 
  group_by(V1) %>% 
  summarize(sum(V2))

final_depth <- as.numeric(summary[summary$V1 == "down",2] - summary[summary$V1 == "up",2])
solution <- final_depth * as.numeric(summary[summary$V1 == "forward",2])
print(solution)

# solution part II
horizontal_position <- 0
vertical_position <- 0
aim <- 0



for (i in 1:nrow(input)){
  if (input[i,1] == "forward"){
    horizontal_position <- horizontal_position + input[i,2]
    vertical_position <- vertical_position + (aim*input[i,2])
  } else if (input[i,1] == "up"){
    aim <- aim - input[i,2]
  } else if (input[i,1] == "down"){
    aim <- aim + input[i,2]
  }
} 

solution <- vertical_position * horizontal_position
print(solution)