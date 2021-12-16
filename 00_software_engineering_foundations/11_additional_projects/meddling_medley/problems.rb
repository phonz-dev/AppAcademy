# PHASE 1

# duos
# Write a method duos that accepts a string as an argument and returns the count of 
# the number of times the same character appears consecutively in the given string.

def duos(str)
  (0...str.length - 1).count { |i| str[i] == str[i + 1] }
end

# Examples

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

##########################################################################################

# sentence_swap
# Write a method sentence_swap that accepts a sentence and a hash as arguments. The method 
# should return a new sentence where every word is replaced with it's corresponding value in 
# the hash. If a word does not exist as a key of the hash, then it should remain unchanged.

def sentence_swap(sentence, swapper)
  words = sentence.split(" ")

  new_words = words.map do |word|
    if swapper.has_key?(word)
      swapper[word]
    else
      word
    end
  end
  
  new_words.join(" ")
end

# Examples

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

##########################################################################################

# hash_mapped
# Write a method hash_mapped that accepts a hash, a proc, and a block. The method should 
# return a new hash where each key is the result of the original key when given to the block. 
# Each value of the new hash should be the result of the original values when passed into the proc.

def hash_mapped(hash, prc, &blk)
  new_hash = {}

  hash.each do |key, value|
    new_key = blk.call(key)
    new_value = prc.call(value)
    new_hash[new_key] = new_value
  end

  new_hash
end

# Examples

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

##########################################################################################

# counted_characters
# Write a method counted_characters that accepts a string as an argument. The method should 
# return an array containing the characters of the string that appeared more than twice. The 
# characters in the output array should appear in the same order they occur in the input string.

def counted_characters(str)
  char_counts = str.split("").inject(Hash.new(0)) do |count, ch|
    count[ch] += 1
    count
  end

  char_counts.select { |k, v| v > 2 }.keys
end

# Examples

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

##########################################################################################

