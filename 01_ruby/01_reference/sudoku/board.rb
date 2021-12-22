require_relative "./tile.rb"

class Board
  VALUES = (1..9).to_a

  def self.empty_board
    Array.new(9) do
      Array.new(9) { Tile.new(0) }
    end
  end

  def self.from_file(file)
    rows = File.readlines(file).map(&:chomp)
    rows.map! do |row|
      nums = row.split("").map(&:to_i)
      nums.map { |num| Tile.new(num) }
    end
    self.new(rows)
  end

  def initialize(grid = Board.empty_board)
    @grid = grid
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, new_value)
    row, col = pos
    tile = self[pos]
    tile.value = new_value
  end

  def render
    puts "  #{(0...@grid.length).to_a.join(" ")}"
    @grid.each_with_index do |row, i|
      puts "#{i} #{row.map(&:to_s).join(" ")}"
    end
    nil
  end

  def rows_complete?
    tile_values.all? { |row| VALUES.all? { |val| row.include?(val) } }
  end

  def tile_values
    @grid.map { |row| row.map { |tile| tile.value } }
  end
end
