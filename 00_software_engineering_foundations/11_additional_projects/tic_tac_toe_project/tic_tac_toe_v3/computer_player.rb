class ComputerPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_positions)
    chosen_position = legal_positions.sample
    puts "Computer #{@mark} chose position #{chosen_position}"
  end
end