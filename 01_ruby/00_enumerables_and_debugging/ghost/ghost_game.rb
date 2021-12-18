require "set"

class GhostGame
  attr_reader :players

  def initialize(*players)
    file = File.open("dictionary.txt")
    @dictionary ||= file.readlines.map(&:chomp).to_set
    @players = players
    @fragment = ""
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players = @players.rotate!
  end

  def valid_play?(str)
    alphabet = ("a".."z").to_set
    possible_word = @fragment + str
    valid_fragment = @dictionary.any? { |word| word.start_with?(possible_word) }

    alphabet.include?(str) && valid_fragment
  end
end

if __FILE__ == $PROGRAM_NAME
  game = GhostGame.new("Dave", "Sarah")

  # p game.valid_play?("z")
end

