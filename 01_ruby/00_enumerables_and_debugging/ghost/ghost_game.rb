require "set"

require_relative "./player.rb"

class GhostGame
  attr_reader :players, :losses

  def initialize(*players)
    file = File.open("dictionary.txt")
    @dictionary = file.readlines.map(&:chomp).to_set
    @players = players.map { |player| Player.new(player) }
    @losses = @players.inject({}) do |losses, player|
      losses[player] = 0
      losses
    end
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

  def play_round
    until self.take_turn(self.current_player)
      puts "-----------------------------"
      puts "CURRENT FRAGMENT: #{@fragment}"
      self.next_player!
    end
  end

  def take_turn(player)
    guess = ""

    until self.valid_play?(guess)
      puts "#{player.name}, give me a letter.."
      guess = player.guess
    end

    @fragment += guess
    @dictionary.include?(@fragment)
  end

  def valid_play?(str)
    alphabet = ("a".."z").to_set
    possible_word = @fragment + str
    valid_fragment = @dictionary.any? { |word| word.start_with?(possible_word) }

    alphabet.include?(str) && valid_fragment
  end

  def record(player)
    losses = @losses[player]
    "GHOST"[0...losses]
  end
end

if __FILE__ == $PROGRAM_NAME
  game = GhostGame.new("Dave", "Sarah")
  # p game.losses
  # game.play_round
end

