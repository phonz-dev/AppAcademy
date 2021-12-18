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

  def run
    until self.game_over?
      self.display_standings
      self.play_round
    end
  end
  
  def play_round
    @fragment = ""
    until self.take_turn(self.current_player)
      puts "----------------------------"
      puts "CURRENT FRAGMENT: #{@fragment}"
      self.next_player!
    end
    
    puts "#{@fragment.upcase} is a word!"
    puts "#{self.current_player.name} gets a letter!"
    puts "----------------------------"
    @losses[self.current_player] += 1
    self.next_player!
  end

  def game_over?
    @losses.values.any? { |value| value == 5 }
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

  def display_standings
    puts "----------------------------"
    puts "PLAYER".ljust(10) + "LOSSES".ljust(10) + "LETTERS"
    puts "----------------------------"
    @players.each do |player|
      name = player.name.capitalize
      losses = @losses[player].to_s
      letters = self.record(player)
      puts name.ljust(10) +  losses.ljust(10) + letters
    puts "----------------------------"
    end
  end

  def record(player)
    losses = @losses[player]
    "GHOST"[0...losses]
  end
end

if __FILE__ == $PROGRAM_NAME
  game = GhostGame.new("Dave", "Sarah")
  # game.display_standings
  game.run
  # game.play_round
end

