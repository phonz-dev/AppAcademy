class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_positions)
    prompt = "Player #{mark}, enter two numbers " + 
    "representing a position in the format `row col`"
    puts prompt
    puts
    pos = nil
    
    until legal_positions.include?(pos)
      pos = gets.chomp.split(" ").map(&:to_i)

      unless legal_positions.include?(pos)
        puts "Invalid position"
        puts prompt
        puts
      end
    end

    pos
  end
end
