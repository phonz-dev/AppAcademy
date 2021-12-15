def zip(*arrays)
  height = arrays.first.length
  (0...height).map { |i| arrays.map { |array| array[i] } }
end

def prizz_proc(arr, prc_1, prc_2)
  arr.select do |el| 
    (prc_1.call(el) || prc_2.call(el)) && 
    !(prc_1.call(el) && prc_2.call(el))
  end
end

def zany_zip(*arrays)
  height = arrays.map(&:length).max
  (0...height).map { |i| arrays.map { |array| array[i] } }
end

def maximum(arr, &prc)
  arr.inject do |el_1, el_2|
    if prc.call(el_1) > prc.call(el_2)
      el_1
    else
      el_2
    end
  end
end

def my_group_by(arr, &prc)
  grouped = Hash.new { |h, k| h[k] = [] }

  arr.each do |el|
    key = prc.call(el)
    grouped[key] << el
  end

  grouped
end

def max_tie_breaker(arr, prc, &blk)
  arr.inject do |max, el|
    if blk.call(max) == blk.call(el)
      prc.call(max) >= prc.call(el) ? max : el
    elsif blk.call(max) > blk.call(el)
      max
    else
      el
    end
  end
end

def change_word(word)
  indices = vowel_indices(word)
  word[indices.first..indices.last]
end

def vowel_indices(word)
  vowels = "aeiou"
  (0...word.length).select { |i| vowels.include?(word[i]) }
end

def silly_syllables(sentence)
  words = sentence.split

  new_words = words.map do |word|
    vowels_count = vowel_indices(word).length
    if vowels_count > 1
      change_word(word)
    else
      word
    end
  end

  new_words.join(" ")
end