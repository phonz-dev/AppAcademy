require "set"

require_relative "./player.rb"

class GhostGame
  def initialize(*players)
    file = File.open("dictionary.txt")
    @dictionary = file.readlines.map(&:chomp).to_set
    @players = players.map { |player| Player.new(player) }
    @losses = @players.inject({}) do |losses, player|
      losses[player] = 0
      losses
    end
  end

  def run
    until self.game_over?
      self.display_standings
      self.play_round
    end

    self.print_winner
  end

  private

  def play_round
    @fragment = ""

    until self.take_turn(self.current_player)
      self.print_dashes
      puts "CURRENT FRAGMENT: #{@fragment}"
      self.next_player!
    end
    
    self.print_post_round_message
    self.update_current_player_losses
    self.check_for_elimination
    self.next_player!
  end

  def print_post_round_message
    puts "--> #{@fragment} is a word!"
    puts "--> #{self.current_player.name} gets a letter!"
    self.print_dashes
  end

  def print_winner
    winner = @losses.select { |k, v| v < 5 }.keys.first
    puts "GAME OVER!"
    puts "👏👏👏 " + winner.name + " wins the game! 👏👏👏"
  end

  def check_for_elimination
    if @losses[self.current_player] >= 5
      self.print_elimination_message
    end
  end

  def print_elimination_message
    puts "#{self.current_player.name} has been eliminated! 😬"
  end

  def update_current_player_losses
    @losses[self.current_player] += 1
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

  def current_player
    @players.first
  end

  def next_player!
    @players = @players.rotate!

    if @losses[self.current_player] == 5
      @players = @players.rotate! until @losses[self.current_player] < 5
    end
  end

  def game_over?
    @losses.values.one? { |value| value < 5 }
  end

  def display_standings
    self.print_dashes
    puts "PLAYER".ljust(10) + "LOSSES".ljust(10) + "LETTERS"
    self.print_dashes

    @players.each do |player|
      name = player.name.capitalize
      losses = @losses[player].to_s
      letters = self.record(player)
      puts name.ljust(10) +  losses.ljust(10) + letters
      self.print_dashes
    end
  end

  def record(player)
    losses = @losses[player]
    "GHOST"[0...losses]
  end

  def print_dashes
    puts "----------------------------"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = GhostGame.new("Dave", "Sarah")
  game.run
end