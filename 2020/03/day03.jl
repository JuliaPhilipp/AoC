using DelimitedFiles
puzzle_input = readdlm("/Users/jphilipp/Documents/AoC/2020/03/puzzle_input.txt", '\t', '\n');

function count_trees(x, y)
    i = 1
    k = 1
    trees = 0
    while i <= length(puzzle_input)
        if puzzle_input[i,][k] == '#'
            trees += 1
        end
        
        k += x
        if k > length(puzzle_input[i,])
            k = k - length(puzzle_input[i,])
        end
        i += y
        
    end
    return trees
end 

print("Part 1:" ,count_trees(3,1), "\n")

print("Part 2:", count_trees(1,1) * count_trees(3,1) * count_trees(5,1) * count_trees(7,1) * count_trees(1,2), "\n")