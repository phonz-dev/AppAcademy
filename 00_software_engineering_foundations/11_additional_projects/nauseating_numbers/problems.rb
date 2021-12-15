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