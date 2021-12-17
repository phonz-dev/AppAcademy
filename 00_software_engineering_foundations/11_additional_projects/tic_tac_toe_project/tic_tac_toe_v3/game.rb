require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
  def initialize(size, players)
    @players = players.to_a.map do |player|
      mark, type = player

      if type
        ComputerPlayer.new(mark)
      else
        HumanPlayer.new(mark)
      end
    end
    @board = Board.new(size)
    @current_player = @players.first
  end

  def switch_turn
    @players.rotate!
    @current_player = @players.first
  end

  def play
    while @board.empty_positions?
      @board.print
      pos = @current_player.get_position(@board.legal_positions)
      mark = @current_player.mark
      @board.place_mark(pos, mark)

      if @board.win?(mark)
        puts "Game Over!"
        puts "Player #{mark} wins!"
        return
      else
        self.switch_turn
      end
    end

    puts "It's a tie!"
  end
end