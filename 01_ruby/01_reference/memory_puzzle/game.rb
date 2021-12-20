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
    end

    puts "Congratulations! You found them all!"
  end

  private

  def make_guess(pos)
    if @previous_guess.nil?
      self.make_first_guess(pos)
    else
      self.make_second_guess(pos)
    end
  end

  def make_first_guess(guess)
    system("clear")
    @board.reveal(guess)
    @previous_guess = guess
    @board.render
    sleep(1)
  end

  def make_second_guess(guess)
    return if @board[guess].face_up?

    system("clear")

    @board.reveal(guess)
    @board.render 

    if @board[@previous_guess] == @board[guess]
      puts "It's a match!"
      sleep(1)
    else
      puts "Try again."
      sleep(1)
      @board[@previous_guess].flip
      @board[guess].flip
    end
    
    @previous_guess = nil
  end

  def prompt
    print "Please enter the position of the card you'd like to flip (e.g., '2,3') \n> "
  end
end