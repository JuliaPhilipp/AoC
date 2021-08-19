puzzle_input <- read.delim("~/Documents/AoC/2020/03/puzzle_input.txt", header=FALSE)

# reformat input to contain one character per column
puzzle_input_formatted <- as.data.frame(matrix(data = NA, nrow= nrow(puzzle_input), ncol = nchar(puzzle_input[1,])))

for (i in 1:nrow(puzzle_input)){
  puzzle_input_formatted[i,] <- unlist(strsplit(puzzle_input[i,], split = ""))
}

# PART 1
# work through input row by row
k = 1
tree_ct = 0
open_ct = 0
for (i in 1:nrow(puzzle_input_formatted)){
  current_space <- puzzle_input_formatted[i,k]
  
  if (current_space == "."){
    open_ct <- open_ct + 1
  } else if (current_space == "#"){
    tree_ct <- tree_ct + 1
  }
  k <- k + 3
  
  # check if k is bigger than grid and if so start over (repeat pattern of trees)
  if (k > ncol(puzzle_input_formatted)){
    k <- k - ncol(puzzle_input_formatted)
  }
}

print(tree_ct)
print(open_ct)

# PART 2

# write a function for tree counting and make right and down parameters
slide <- function(down, right, df){
  k = 1
  tree_ct = 0
  open_ct = 0
  
  for (i in seq(1, nrow(df), by = down)){
    current_space <- df[i,k]
    
    if (current_space == "."){
      open_ct <- open_ct + 1
    } else if (current_space == "#"){
      tree_ct <- tree_ct + 1
    }
    k <- k + right
    
    # check if k is bigger than grid and if so start over (repeat pattern of trees)
    if (k > ncol(df)){
      k <- k - ncol(df)
    }
  }
  
  return(tree_ct)
  
}

# test function
test_tree_ct <- slide(1,3, puzzle_input_formatted)

# apply to all conditions
tree_ct_A <- slide(1,1, puzzle_input_formatted)
tree_ct_B <- slide(1,3, puzzle_input_formatted)
tree_ct_C <- slide(1,5, puzzle_input_formatted) 
tree_ct_D <- slide(1,7, puzzle_input_formatted) 
tree_ct_E <- slide(2,1, puzzle_input_formatted) 

# automate/collapse the apply to all conditions, e.g with lapply?

# final product
product_trees <- tree_ct_A * tree_ct_B * tree_ct_C * tree_ct_D * tree_ct_E


