require_relative "./board.rb"

class Game
  def initialize
    @board = Board.new
    @previous_guess = nil
  end

  def make_guess(guess)
    if @previous_guess.nil?
      @previous_guess = guess
      @board.reveal(@previous_guess)
      return
    end

    next_guess = guess

    if @board[@previous_guess] == @board[next_guess]
      @board.reveal(next_guess)
      puts "It's a match!"
    else
      @board[@previous_guess].flip
      @board[next_guess].flip
      puts "Try again."
    end
    
    @previous_guess = nil
  end
end