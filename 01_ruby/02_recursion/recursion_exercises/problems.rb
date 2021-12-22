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
