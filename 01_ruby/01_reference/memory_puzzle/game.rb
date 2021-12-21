require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
  def initialize(player)
    @player = player
    @board = Board.new
    @previous_guess = nil
  end

  def play
    @board.populate
    
    until @board.won?
      pos = self.parse_position
      self.make_guess(pos)
      sleep(1.5)
    end

    puts "Congratulations! You found them all!"
  end

  private
  def make_guess(current_guess)
    return if @board[current_guess].face_up?
    
    @board.reveal(current_guess)
    self.reset_display

    if self.first_guess?
      @previous_guess = current_guess
      return
    end

    self.parse_guesses(@previous_guess, current_guess)
    self.reset_previous_guess
  end

  def parse_guesses(guess_1, guess_2)
    if @board[guess_1] == @board[guess_2]
      puts "It's a match!"
    else
      puts "Try again."
      @board[guess_1].flip
      @board[guess_2].flip
    end
  end

  def parse_position(guess_pos = nil)
    pos = guess_pos

    until @board.valid_position?(pos)
      self.reset_display
      @player.prompt
      pos = @player.get_input
      
      unless @board.valid_position?(pos)
        self.reset_display
        @board.print_position_error_message
        sleep(1.5)
      end
    end

    pos.map(&:to_i)
  end

  def reset_previous_guess
    @previous_guess = nil
  end

  def first_guess?
    @previous_guess.nil?
  end

  def reset_display
    system("clear")
    @board.render
  end
end