# read from a file and return the lines as an array of integers
def read_from_file(file_name)
    File.readlines(file_name).map(&:to_i)
end

# count the number of times a number is bigger than the previous number in an array
def count_bigger_than_previous(array)
    count = 0
    array.each_with_index do |num, index|
        if index > 0 && num > array[index - 1]
            count += 1
        end
    end
    count
end

p count_bigger_than_previous(read_from_file('day1.sample'))
p count_bigger_than_previous(read_from_file('day1.input'))


# generate a sliding window of size 3 from an array of elements
def sliding_window(array)
    array.each_cons(3)
end

# sum every element in a subarray
def sum_subarrays(subarray)
    subarray.map(&:sum)
end

p count_bigger_than_previous(sum_subarrays(sliding_window(read_from_file('day1.sample'))))
p count_bigger_than_previous(sum_subarrays(sliding_window(read_from_file('day1.input'))))