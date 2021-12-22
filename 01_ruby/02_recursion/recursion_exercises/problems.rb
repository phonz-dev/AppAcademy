require "byebug"

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

# Exponentiation
# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def exponent_one(base, power)
  return 1 if power.zero?
  base * exponent(base, power - 1)
end

def exponent_two(base, power)
  return 1 if power.zero?
  return base if power == 1

  if power.even?
    result = exponent_two(base, power / 2)
    square(result)
  else
    result = exponent_two(base, (power - 1) / 2)
    base * square(result)
  end
end

def square(num)
  num * num
end

# p exponent_two(3, 0) #=> 1
# p exponent_two(5, 2) #=> 25
# p exponent_two(3, 3) #=> 27

#############################################################################

# Using recursion and the is_a? method, write an Array#deep_dup method that will 
# perform a "deep" duplication of the interior arrays.

class Array
  def deep_dup
    new_array = []

    self.each do |el|
      if el.is_a?(Array)
        new_array << [*el.deep_dup]
      else
        new_array << el
      end
    end

    new_array
  end
end

#############################################################################

# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in 
# an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to do 
# this just passing a single argument for the number of Fibonacci numbers requested.

def iterative_fib(n)
  seq = [0, 1]

  while seq.length < n
    next_seq = seq[-1] + seq[-2]
    seq << next_seq
  end

  seq[0...n]
end

# p iterative_fib(0) #=> []
# p iterative_fib(2) #=> [0, 1]
# p iterative_fib(3) #=> [0, 1, 1]
# p iterative_fib(5) #=> [0, 1, 1, 2, 3]

def recursive_fib(n)
  return [] if n.zero?
  return [0] if n == 1
  return [0, 1] if n == 2

  seq = recursive_fib(n - 1)
  next_seq = seq[-1] + seq[-2]
  seq << next_seq
  seq
end

# p recursive_fib(0) #=> []
# p recursive_fib(2) #=> [0, 1]
# p recursive_fib(3) #=> [0, 1, 1]
# p recursive_fib(5) #=> [0, 1, 1, 2, 3]

#############################################################################

# Write a recursive binary search: bsearch(array, target). Note that binary search 
# only works on sorted arrays. Make sure to return the location of the found object 
# (or nil if not found!). Hint: you will probably want to use subarrays.

def bsearch(array, target, low = 0, high = array.length - 1)
  return nil if low > high

  mid = (low + high) / 2

  if target == array[mid]
    return mid
  elsif target < array[mid]
    bsearch(array, target, low, mid - 1)
  else
    bsearch(array, target, mid + 1, high)
  end
end

# Make sure that these test cases are working:

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

#############################################################################

# Merge Sort
# Implement a method merge_sort that sorts an Array

def merge_sort(nums)
  return nums if nums.length < 2

  half = nums.length / 2
  left, right = nums.take(half), nums.drop(half)
  sorted_left, sorted_right = merge_sort(left), merge_sort(right)

  merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged = []

  until left.empty? || right.empty? 
    smallest_num = left.first < right.first ? left.shift : right.shift
    merged << smallest_num
  end

  merged + left + right
end

#############################################################################
