require "set"

class WordChainer
  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map(&:chomp).to_set
  end

  def run(source, target)
    @current_words = [source]
    @all_seen_words = { source => nil }

    until @current_words.empty? || @all_seen_words.include?(target)
      explore_current_words
    end

    build_path(target)
  end

  def build_path(target)
    path = [target]
    
    until @all_seen_words[path.first].nil?
      prev = @all_seen_words[path.first]
      path.unshift(prev)
    end

    path
  end

  def explore_current_words
    new_current_words = []
      
    @current_words.each do |current_word|
      current_adjacent_words = adjacent_words(current_word)

      current_adjacent_words.each do |adjacent_word|
        next if @all_seen_words.has_key?(adjacent_word)
        new_current_words << adjacent_word
        @all_seen_words[adjacent_word] = current_word
      end
    end

    @current_words = new_current_words
  end

  def adjacent_words(word)
    adjacent_words = []

    word.each_char.with_index do |old_letter, i|
      ("a".."z").each do |new_letter|
        next if old_letter == new_letter
        new_word = word.dup
        new_word[i] = new_letter
        adjacent_words << new_word if @dictionary.include?(new_word)
      end
    end

    adjacent_words
  end
end

if __FILE__ == $PROGRAM_NAME
  puts WordChainer.new("dictionary.txt").run(ARGV[0], ARGV[1])
end