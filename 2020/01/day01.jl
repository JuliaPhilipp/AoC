using DelimitedFiles
puzzle_input = readdlm("/Users/jphilipp/Documents/AoC/2020/01/puzzle_input.txt", '\t', Int, '\n');

# Part 1
for i in puzzle_input, k in puzzle_input
    test_sum = i + k
    if test_sum == 2020
        test_product = i*k
        print("Part 1: ",test_product)
        break
    end
end

# Part 2
ffor i in puzzle_input, j in puzzle_input, k in puzzle_input
    test_sum = i+k+j
    if test_sum == 2020
        test_product = i*j*k
        print("Part 2: ",test_product)
        break
    end
end

