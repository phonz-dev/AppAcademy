require "byebug"

require_relative "./card.rb"

class Board
  VALUES = ("A".."Z").to_a

  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate
    pair_positions = self.pair_positions
    pair_values = VALUES.sample(pair_positions.length)

    pair_positions.each_with_index do |pair_pos, i|
      pos_1, pos_2 = pair_pos
      value = pair_values[i]
      self[pos_1], self[pos_2] = Card.new(value), Card.new(value)
    end

    nil
  end

  def render
    puts "  " + (0...@grid.length).to_a.join(" ")
    @grid.each_with_index do |row, i| 
      puts i.to_s + " " + row.map(&:to_s).join(" ")
    end
    nil
  end

  def won?
    @grid.all? { |row| row.all?(&:face_up?) }
  end

  def reveal(guessed_pos)
    card = self[guessed_pos]
    card.flip unless card.face_up?
    card.value
  end

  def pair_positions
    pair_positions = []
    positions = self.board_positions.shuffle

    i = 0

    while i < positions.length
      pos_1, pos_2 = positions[i], positions[i + 1]
      pair_positions << [pos_1, pos_2]
      
      i += 2
    end
    
    pair_positions
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
