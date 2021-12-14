class Board
  def self.print_grid(grid)
    grid.each { |row| puts row.join(" ") }
  end

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

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    ship_count = (@size * 0.25).to_i 
    rand_positions = self.board_positions.sample(ship_count)
    rand_positions.each { |pos| self[pos] = :S }
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

  def hidden_ships_grid
    @grid.map { |row| row.map { |el| el == :S ? :N : el} }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end