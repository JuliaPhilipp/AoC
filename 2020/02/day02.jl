using DelimitedFiles
using DataStructures
puzzle_input = readdlm("/Users/jphilipp/Documents/AoC/2020/02/puzzle_input.txt", '\t', '\n')

## PART 1
function check_valid(x)
    true_ct = 0
    for i in x
       min = parse(Int64,split(i, "-")[1])
    max = parse(Int64,split(split(i,"-")[2])[1])
    letter = only(split(split(i)[2],":")[1])
    pw = split(i,": ")[2]
    ct = counter(pw)
        
        if (ct[letter] >= min && ct[letter] <= max)
        true_ct += 1
        end
    end
    return(true_ct)
end

true_pw = check_valid(puzzle_input)

print("Part 1: Valid passwords: ", true_pw, "\n")



## PART 2
function check_position(x)
    true_ct = 0
    for i in x
        pos1 = parse(Int64,split(i, "-")[1])
        pos2 = parse(Int64,split(split(i,"-")[2])[1])
        letter = only(split(split(i)[2],":")[1])
        pw = split(i,": ")[2]
        
        if (xor(pw[pos1] == letter, pw[pos2] == letter))
            true_ct += 1
        end
    end
    return(true_ct)
end

valid_pw = check_position(puzzle_input)

print("Part 2: Valid passwords: ", valid_pw, "\n")
