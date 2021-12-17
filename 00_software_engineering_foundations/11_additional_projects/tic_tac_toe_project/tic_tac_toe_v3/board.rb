class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, "_") }
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
    len = @grid.length
    (row < len && row >= 0) && (col < len && col >=0)
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

  def win?(mark)
    self.win_row?(mark) ||
    self.win_col?(mark) ||
    self.win_diagonal?(mark)
  end

  def win_row?(mark, grid = @grid)
    grid.any? { |row| row.uniq.length == 1 && row.first == mark }
  end

  def win_col?(mark)
    transposed = @grid.transpose
    win_row?(mark, transposed)
  end

  def win_diagonal?(mark)
    diagonals = self.get_diagonals
    win_row?(mark, diagonals)
  end

  def empty_positions?
    len = @grid.length
    (0...len).any? { |row| (0...len).any? { |col| self.empty?([row, col]) } }
  end

  def get_diagonals
    upward = []
    downward = []

    i = 0
    j = @grid.length - 1

    while i < @grid.length
      upward << self[[j, i]]
      downward << self[[i, i]]

      i += 1
      j -= 1
    end

    [upward, downward]
  end

  def board_positions
    positions = []

    (0...@grid.length).map do |row|
      (0...@grid.length).map do |col|
        positions << [row, col]
      end
    end

    positions
  end
end
