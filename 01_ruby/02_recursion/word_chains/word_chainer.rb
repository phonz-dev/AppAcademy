require "set"

class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp).to_set
  end

  def adjacent_words(word)
    adjacent_words = Set.new

    @dictionary.each do |dict_word|
      if one_letter_difference?(word, dict_word)
        adjacent_words.add(dict_word)
      end
    end

    adjacent_words
  end

  def one_letter_difference?(word_1, word_2)
    return false unless word_1.length == word_2.length
    same_letters_count = count_same_letters(word_1, word_2)

    # same letters count for both words must be word length - 1
    same_letters_count == word_1.length - 1
  end

  def get_letters_count(word)
    word.split("").inject(Hash.new(0)) do |count, ch|
      count[ch] += 1
      count
    end
  end
  
  def count_same_letters(word_1, word_2)
    counts_1 = get_letters_count(word_1)
    counts_2 = get_letters_count(word_2)
    same_count = 0
  
    counts_1.each do |ch, count|
      if count == counts_2[ch]
        same_count += 1
      end
    end
  
    same_count
  end
end

if __FILE__ == $PROGRAM_NAME
  w = WordChainer.new("dictionary.txt")
  p w.adjacent_words("ruby")
end