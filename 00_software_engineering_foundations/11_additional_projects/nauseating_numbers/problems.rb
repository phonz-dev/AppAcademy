# PHASE 1

# strange_sums
# Write a method strange_sums that accepts an array of numbers as an argument. 
# The method should return a count of the number of distinct pairs of elements 
# that have a sum of zero. You may assume that the input array contains unique 
# elements.

def strange_sums(nums)
  zero_sum_count = 0

  (0...nums.length).each do |idx_1|
    (idx_1 + 1...nums.length).each do |idx_2|
      num_1, num_2 = nums[idx_1], nums[idx_2]
      zero_sum_count += 1 if num_1 + num_2 == 0 
    end
  end

  zero_sum_count
end


# Examples

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

##################################################################################

# pair_product
# Write a method pair_product that accepts an array of numbers and a product as arguments. 
# The method should return a boolean indicating whether or not a pair of distinct elements 
# in the array result in the product when multiplied together. You may assume that the input 
# array contains unique elements.

def pair_product(nums, product)
  (0...nums.length).each do |idx_1|
    (idx_1 + 1...nums.length).each do |idx_2|
      num_1, num_2 = nums[idx_1], nums[idx_2]
      return true if num_1 * num_2 == product
    end
  end

  false
end

# Examples

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

##################################################################################

# rampant_repeats
# Write a method rampant_repeats that accepts a string and a hash as arguments. The 
# method should return a new string where characters of the original string are repeated 
# the number of times specified by the hash. If a character does not exist as a key of the 
# hash, then it should remain unchanged.

def rampant_repeats(str, hash)
  new_str = ""

  str.each_char do |ch|
    if hash.has_key?(ch)
      num = hash[ch]
      num.times { new_str += ch }
    else
      new_str += ch
    end
  end

  new_str
end

# Examples

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

##################################################################################

# perfect_square?
# Write a method perfect_square? that accepts a number as an argument. The method 
# should return a boolean indicating whether or not the argument is a perfect square. 
# A perfect square is a number that is the product of some number multiplied by itself. 
# For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is 
# not a perfect square.

def perfect_square?(num)
  (1..num).any? { |n| n * n == num }
end

# Examples

# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false

##################################################################################
##################################################################################

# PHASE 2

# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. The method should 
# return true if the given number has more divisors than all positive numbers less than 
# the given number. For example, 24 is an anti-prime because it has more divisors than 
# any positive number less than 24. Math Fact: Numbers that meet this criteria are also 
# known as highly composite numbers.

def anti_prime?(num)
  num_divisors_count = count_divisors(num)
  (1...num).none? { |other_num| count_divisors(other_num) > num_divisors_count }
end

def count_divisors(num)
  (1..num).count { |divisor| num % divisor == 0 }
end

# Examples

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

##################################################################################

# matrix_addition
# Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition 
# that accepts two matrices as arguments. The two matrices are guaranteed to have the 
# same "height" and "width". The method should return a new matrix representing the sum 
# of the two arguments. To add matrices, we simply add the values at the same positions:

# programmatically
# [[2, 5], [4, 7]] + [[9, 1], [3, 0]] => [[11, 6], [7, 7]]

# structurally
# 2 5  +  9 1  =>  11 6
# 4 7     3 0      7 7

def matrix_addition(matrix_1, matrix_2)
  height = matrix_1.length
  width = matrix_1.first.length

  (0...height).map do |i|
    (0...width).map { |j| matrix_1[i][j] + matrix_2[i][j] }
  end
end

# Examples

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

##################################################################################

# mutual_factors
# Write a method mutual_factors that accepts any amount of numbers as arguments. The 
# method should return an array containing all of the common divisors shared among the 
# arguments. For example, the common divisors of 50 and 30 are 1, 2, 5, 10. You can assume 
# that all of the arguments are positive integers.

def mutual_factors(*nums)
  (1..nums.min).select do |divisor|
    factors_count = nums.count { |num| num % divisor == 0 }
    factors_count == nums.length
  end
end

# Examples

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]