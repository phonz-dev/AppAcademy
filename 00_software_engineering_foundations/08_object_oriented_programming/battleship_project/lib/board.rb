class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n).fill(:N)}
    @size = n * n
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count { |val| val == :S } 
  end
end
