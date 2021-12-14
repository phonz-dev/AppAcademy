require "byebug"

# GENERAL PROBLEMS

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

#####################################################################

# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by offsetting each letter 
# in the word by a fixed number, called the key. Given a key of 3, for 
# example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a 
# sequence of keys is used. For example, if we encrypt "bananasinpajamas" 
# with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a 
# key-sequence as args, returning the encrypted message. Assume that the message 
# consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
  alphabet = ("a".."z").to_a
  new_message = ""
  
  message.each_char.with_index do |char, i|
    old_idx = alphabet.index(char)
    new_idx = keys[i % keys.length] + old_idx 
    new_char = alphabet[new_idx % alphabet.length]

    new_message += new_char
  end

  new_message
end

# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

#####################################################################

# vowel_rotate
# Write a method vowel_rotate(str) that accepts a string as an arg and 
# returns the string where every vowel is replaced with the vowel that 
# appears before it sequentially in the original string. The first vowel 
# of the string should be replaced with the last vowel.

def vowel_rotate(str)
  vowels = "aeiou"
  str_vowels = str.split("").select { |char| vowels.include?(char) }
  new_str_vowels = str_vowels.rotate(-1)
  new_str = ""
  
  str.each_char do |char|
    if vowels.include?(char)
      new_str += new_str_vowels.shift
    else
      new_str += char
    end
  end

  new_str
end

# Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

#####################################################################
#####################################################################


# PROC PROBLEMS

# String#select
# Extend the string class by defining a String#select method that accepts 
# a block. The method should return a new string containing characters of 
# the original string that return true when passed into the block. If no 
# block is passed, then return the empty string. Do not use the built-in 
# Array#select in your solution.

class String
  def select(&prc)
    return "" if prc.nil?
    new_str = ""
    self.each_char { |ch| new_str += ch if prc.call(ch) }
    new_str
  end
end

# Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

#####################################################################

# String#map!
# Extend the string class by defining a String#map! method that accepts a block. 
# The method should modify the existing string by replacing every character with 
# the result of calling the block, passing in the original character and it's index. 
# Do not use the built-in Array#map or Array#map! in your solution.

class String
  def map!(&prc)
    self.each_char.with_index do |ch, i|
      if prc.call(ch, i)
        self[i] = prc.call(ch, i)
      end
    end
  end
end

# Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

#####################################################################
#####################################################################

# RECURSION PROBLEMS

# multiply
# Write a method multiply(a, b) that takes in two numbers and returns their product.

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator

def multiply(a, b)
  return 0 if b == 0

  if b < 0
    -(a + multiply(a, -b - 1))
  else
    a + multiply(a, b - 1)
  end
end

# Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

#####################################################################

# lucas_sequence
# The Lucas Sequence is a sequence of numbers. The first number of the 
# sequence is 2. The second number of the Lucas Sequence is 1. To generate 
# the next number of the sequence, we add up the previous two numbers. For 
# example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Write a method lucas_sequence that accepts a number representing a length as 
# an arg. The method should return an array containing the Lucas Sequence up to 
# the given length. Solve this recursively.

def lucas_sequence(length)
  return [] if length == 0
  return [2] if length == 1
  return [2, 1] if length == 2

  prev = lucas_sequence(length - 1)
  next_seq = prev[prev.length - 1] + prev[prev.length - 2]

  [*prev, next_seq]
end

# Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]