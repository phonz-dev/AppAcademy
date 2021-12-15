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

