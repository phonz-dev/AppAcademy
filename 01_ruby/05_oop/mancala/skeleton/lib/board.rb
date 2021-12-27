class Board
  attr_accessor :cups

  STORES = [6, 13]
  CUPS_NUM = 14

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = (0...CUPS_NUM).map do |i|
      STORES.include?(i) ? [] : Array.new(4).fill(:stone)
    end
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0, CUPS_NUM)
      raise "Invalid starting cup"
    end
    
    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
