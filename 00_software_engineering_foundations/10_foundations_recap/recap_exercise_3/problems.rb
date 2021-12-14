require "byebug"

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

#####################################################################

# char_indices
# Write a method char_indices(str) that takes in a string as an arg. The 
# method should return a hash containing characters as keys. The value 
# associated with each key should be an array containing the indices where 
# that character is found.

def char_indices(str)
  indices = Hash.new { |h, k| h[k] = [] }
  str.each_char.with_index { |ch, i| indices[ch] << i }
  indices
end

# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

#####################################################################

# longest_streak
# Write a method longest_streak(str) that accepts a string as an arg. 
# The method should return the longest streak of consecutive characters 
# in the string. If there are any ties, return the streak that occurs 
# later in the string.

def longest_streak(str)
  longest = ""
  i = 0

  while i < str.length
    current = ""
    ch = str[i]

    while ch == str[i]
      current += ch
      i += 1
    end

    if current.length >= longest.length
      longest = current
    end
  end
  
  longest
end

# Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

#####################################################################

# bi_prime?
# Write a method bi_prime?(num) that accepts a number as an arg and returns 
# a boolean indicating whether or not the number is a bi-prime. A bi-prime is 
# a positive integer that can be obtained by multiplying two prime numbers.

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

def bi_prime?(num)
  (2...num).each do |divisor_1|
    (divisor_1...num).each do |divisor_2|
      if prime?(divisor_1) && prime?(divisor_2)
        return true if divisor_1 * divisor_2 == num
      end
    end
  end

  false
end

def prime?(num)
  return false if num < 2
  (2...num).none? { |divisor| num % divisor == 0 }
end

# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false
