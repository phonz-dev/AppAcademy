require_relative "./board.rb"

class Game
  def initialize
    @board = Board.new
    @previous_guess = nil
  end

  def play
    @board.populate
    
    until @board.won?
      system("clear")
      @board.render
      self.prompt
      pos = gets.chomp.split(",").map(&:to_i)
      self.make_guess(pos)
      sleep(1.5)
    end

    puts "Congratulations! You found them all!"
  end

  private
  def make_guess(current_guess)
    return if @board[current_guess].face_up?

    system("clear")
    @board.reveal(current_guess)
    @board.render

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

  def reset_previous_guess
    @previous_guess = nil
  end

  def first_guess?
    @previous_guess.nil?
  end

  def prompt
    print "Please enter the position of the card you'd like to flip (e.g., '2,3') \n> "
  end
end