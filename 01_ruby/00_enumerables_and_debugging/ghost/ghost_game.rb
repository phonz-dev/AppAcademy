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
end

if __FILE__ == $PROGRAM_NAME
  game = GhostGame.new("Dave", "Sarah")

  p game

  # p game.current_player
  # game.next_player!
  # p game.current_player
end