# read from a file and return the lines as an array
# the lines are in the format '<string> <number>'
def read_from_file(file_name)
    File.readlines(file_name).map do |line|
        string, number = line.split(' ')
        [string, number.to_i]
    end
end

# on a cartesian coordinate system, starting at 0,0
# calculate final position based on the instructions given in the following format 'instruction steps'
# for instruction 'forward', move steps to the right
# for instruction 'down', move steps down
# for instruction 'up', move steps up
def calculate_final_position(instructions)
    x = 0
    y = 0
    instructions.each do |instruction, steps|
        case instruction
        when 'forward'
            x += steps
        when 'down'
            y -= steps
        when 'up'
            y += steps
        end
    end
    [x, y]
end


# calculate the product between the values of a coordinate
def calculate_product(coordinate)
    coordinate.reduce(:*).abs
end

p calculate_product calculate_final_position read_from_file 'day2.sample'
p calculate_product calculate_final_position read_from_file 'day2.input'

# on a cartesian coordinate system, starting at 0,0
# track a value called `aim` which also starts at 0
# calculate final position based on the instructions given in the following format 'instruction steps'
# for instruction 'up', increses `aim` by `steps`
# for instruction 'down', decreses `aim` by `steps`
# for instruction 'forward', increse horizontal position by `steps` and decrease vertical position by `aim` multiplied by `steps`
def calculate_final_position_with_aim(instructions)
    x = 0
    y = 0
    aim = 0
    instructions.each do |instruction, steps|
        case instruction
        when 'up'
            aim += steps
        when 'down'
            aim -= steps
        when 'forward'
            x += steps
            y -= steps * aim
        end
    end
    [x, y]
end

p calculate_product calculate_final_position_with_aim read_from_file 'day2.sample'
p calculate_product calculate_final_position_with_aim read_from_file 'day2.input'