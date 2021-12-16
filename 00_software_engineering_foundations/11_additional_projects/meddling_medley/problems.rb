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

# triplet_true?
# Write a method triplet_true? that accepts a string as an argument and returns a boolean 
# indicating whether or not the string contains three of the same character consecutively.

def triplet_true?(str)
  (0...str.length - 2).each do |i|
    if str[i] == str[i + 1] && str[i] == str[i + 2]
      return true
    end
  end

  false
end

# Examples

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false

##########################################################################################

# energetic_encoding
# Write a method energetic_encoding that accepts a string and a hash as arguments. The method 
# should return a new string where characters of the original string are replaced with the 
# corresponding values in the hash. If a character is not a key of the hash, then it should be 
# replaced with a question mark ('?'). Space characters (' ') should remain unchanged.

def energetic_encoding(str, hash)
  new_chars = str.split("").map do |ch|
    if ch == " "
      " "
    elsif hash.has_key?(ch)
      hash[ch]
    else
      "?"
    end
  end

  new_chars.join("")
end

# Examples

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

##########################################################################################

# uncompress
# Write a method uncompress that accepts a string as an argument. The string will be formatted 
# so every letter is followed by a number. The method should return an "uncompressed" version of 
# the string where every letter is repeated multiple times given based on the number that appears 
# directly after the letter.

def uncompress(str)
  uncompressed = ""

  i = 1

  while i < str.length
    num = str[i].to_i
    char = str[i - 1]
    num.times { uncompressed += char }

    i += 2
  end

  uncompressed
end

# Examples

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

##########################################################################################
##########################################################################################

# PHASE 2

# conjunct_select
# Write a method conjunct_select that accepts an array and one or more procs as arguments. 
# The method should return a new array containing the elements that return true when passed 
# into all of the given procs.

def conjunct_select(arr, *procs)
  arr.select { |el| procs.all? { |prc| prc.call(el) } }
end

# Examples

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

##########################################################################################

# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an argument. The method should 
# translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
  # if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
  # if the word begins with a non-vowel, move all letters that come before the word's first vowel to the 
  # end of the word and add 'ay' (example: 'trash'->'ashtray')

# Note that if words are capitalized in the original sentence, they should remain capitalized in the 
# translated sentence. Vowels are the letters a, e, i, o, u.

def append_yay(word)
  word + "yay"
end

def append_ay(word)
  vowels = "aeiou"

  (0...word.length).each do |i|
    if vowels.include?(word[i])
      new_word = word[i..-1] + word[0...i] + "ay"

      if word == word.capitalize
        return new_word.capitalize
      else
        return new_word
      end
    end
  end
  
  word
end

def begins_with_vowel?(word)
  vowels = "aeiou"
  vowels.include?(word[0].downcase)
end

def convert_pig_latin(sentence)
  words = sentence.split(" ")

  new_words = words.map do |word|
    if word.length <= 2
      word
    elsif begins_with_vowel?(word)
      append_yay(word)
    else
      append_ay(word)
    end
  end

  new_words.join(" ")
end

# Examples

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

##########################################################################################

# reverberate
# Write a method reverberate that accepts a sentence as an argument. The method should translate 
# the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
  # if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
  # if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, 
  # including the last vowel itself (example: 'trash'->'trashash')

# Note that if words are capitalized in the original sentence, they should remain capitalized in 
# the translated sentence. Vowels are the letters a, e, i, o, u.

def repeat_word(word)
  new_word = word + word

  if word == word.capitalize
    return new_word.capitalize
  end

  new_word
end

def echo_word(word)
  vowels = "aeiou"

  (word.length - 1).downto(0) do |i|
    char = word[i]

    if vowels.include?(char)
      return word + word[i..-1]
    end
  end

  word
end

def ends_with_vowel?(word)
  vowels = "aeiou"
  vowels.include?(word[-1])
end

def reverberate(sentence)
  words = sentence.split(" ")

  new_words = words.map do |word|
    if word.length < 3
      word
    elsif ends_with_vowel?(word)
      repeat_word(word)
    else
      echo_word(word)
    end
  end

  new_words.join(" ")
end

# Examples

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

##########################################################################################
