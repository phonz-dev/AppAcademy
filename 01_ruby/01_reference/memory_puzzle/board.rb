require_relative "./card.rb"

class Board
  VALUES = ("A".."Z").to_a

  def initialize
    @grid = Array.new(4) { Array.new(4, Card.new) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def board_positions
    positions = []

    (0...@grid.length).each do |row|
      (0...@grid.length).each do |col|
        positions << [row, col]
      end
    end

    positions
  end
end
