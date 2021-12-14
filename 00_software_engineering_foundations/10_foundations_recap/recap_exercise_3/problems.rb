# no_dupes?
# Write a method no_dupes?(arr) that accepts an array as an arg 
# and returns an new array containing the elements that were not 
# repeated in the array.

def no_dupes?(arr)
  el_counts = arr.inject(Hash.new(0)) do |hash, el|
    hash[el] += 1
    hash
  end

  el_counts.select { |k, v| v == 1 }.keys
end

# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

#####################################################################

# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as 
# an arg. The method should return true if an element never appears 
# consecutively in the array; it should return false otherwise.

def no_consecutive_repeats?(arr)
  return true if arr.length <= 1
  return false if arr[0] == arr[1]
  no_consecutive_repeats?(arr[1..-1])
end

# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true