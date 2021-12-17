class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, "_") }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def valid?(pos)
    row, col = pos
    (row < 3 && row >= 0) && (col < 3 && col >=0)
  end

  def empty?(pos)
    self[pos] == "_"
  end

  def place_mark(pos, mark)
    unless self.valid?(pos) && self.empty?(pos)
      raise "invalid mark"
    end

    self[pos] = mark
  end

  def print
    @grid.each { |row| puts row.join(" ") }
  end
end
