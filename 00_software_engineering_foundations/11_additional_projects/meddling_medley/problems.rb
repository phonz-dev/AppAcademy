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

