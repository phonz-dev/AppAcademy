def partition(arr, mid)
  less_than_num, greater_than_num = [], []

  arr.each do |num|
    if num < mid
      less_than_num << num
    else
      greater_than_num << num
    end
  end

  [less_than_num, greater_than_num]
end

def merge(hash_1, hash_2)
  {**hash_1, **hash_2}
end

def censor(sentence, curses)
  words = sentence.split
  new_words = words.map do |word|
    if curses.include?(word.downcase)
      star_vowels(word)
    else
      word
    end
  end

  new_words.join(" ")
end

def star_vowels(word)
  vowels = "aeiou"
  chars = word.split("")

  new_chars = chars.map do |char|
    if vowels.include?(char.downcase)
      "*"
    else
      char
    end
  end

  new_chars.join("")
end

def power_of_two?(num)
  (0...num).any? { |exponent| 2 ** exponent == num }
end