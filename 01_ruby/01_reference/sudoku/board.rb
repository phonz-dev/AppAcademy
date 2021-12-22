require_relative "./tile.rb"

class Board
  def self.empty_board
    Array.new(9) do
      Array.new(9) { Tile.new(0) }
    end
  end

  def initialize(grid = Board.empty_board)
    @grid = grid
  end
end
