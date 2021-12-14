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

# # Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []