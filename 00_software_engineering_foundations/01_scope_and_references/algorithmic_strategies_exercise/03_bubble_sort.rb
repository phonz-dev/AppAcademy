# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

def bubble_sort(nums)
  not_sorted = true

  while not_sorted
    not_sorted = false

    (0...nums.length - 1).each do |i|
      if nums[i] > nums[i + 1]
        nums[i], nums[i + 1] = nums[i + 1], nums[i]
        not_sorted = true
      end
    end
  end

  nums
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]