class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position
    num_chars = " 0123456789"

    puts "Player #{mark}, enter two numbers representing a position in the format `row col`"

    input = gets.chomp
    pos = input.split(" ")
    valid_chars = input.split("").all? { |ch| num_chars.include?(ch) }

    unless pos.length == 2 && valid_chars
      raise "sorry, that was invalid :("
    end

    pos.map(&:to_i)
  end
end