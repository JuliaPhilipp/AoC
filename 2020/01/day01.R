puzzle_input <- read.delim("~/Documents/AoC/2020/01/puzzle_input.txt", header = FALSE)

# part 1
for(i in 1:nrow(puzzle_input)) {
  current_line <- puzzle_input[i,]
  
  # test all other lines
  for (k in (i+1):nrow(puzzle_input)){
    if (k < nrow(puzzle_input)){
      other_line <- puzzle_input[k,]
      test_sum <- sum(current_line, other_line)
      
      if (test_sum == 2020){
        test_product <- current_line * other_line
        print(test_product)
        break
      } 
    }
    
  }
  
}

## part 2
for (i in 1:nrow(puzzle_input)) {
  line_A <- puzzle_input[i,]
  
  # second part
  for (k in (i+1):nrow(puzzle_input)){
    if (k < nrow(puzzle_input)){
      line_B <- puzzle_input[k,]
    }
    
    for (j in (k+1):nrow(puzzle_input)){
      if (j < nrow(puzzle_input)){
        line_C <- puzzle_input[j,]
        
        # test sum
        test_sum <- sum(line_A, line_B, line_C)
        if (test_sum == 2020){
          test_product <- line_A*line_B*line_C
          print(test_product)
          break
          
        } else {}
      }
      
    }
  }
}

