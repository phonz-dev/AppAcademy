# Write a recursive method, range, that takes a start and an end and returns 
# an array of all numbers in that range, exclusive. For example, range(1, 5) 
# should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(start_num, end_num)
  return [] if start_num >= end_num
  [start_num, *range(start_num + 1, end_num)]
end


# p range(1, 5) #=> [1, 2, 3, 4]

#############################################################################

# Write both a recursive and iterative version of sum of an array.

def recursive_sum_array(nums_array)
  return 0 if nums_array.empty?
  nums_array.first + recursive_sum_array(nums_array[1..-1])
end

# p recursive_sum_array([]) #=> 0
# p recursive_sum_array([1, 2, 3, 4]) #=> 10

def iterative_sum_array(nums_array)
  sum = 0
  nums_array.each { |num| sum += num }
  sum
end

# p iterative_sum_array([]) #=> 0
# p iterative_sum_array([1, 2, 3, 4]) #=> 10

#############################################################################

