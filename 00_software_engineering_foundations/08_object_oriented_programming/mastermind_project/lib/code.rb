class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(pegs)
    valid_pegs = POSSIBLE_PEGS.keys
    pegs.map(&:capitalize)
        .all? { |peg| valid_pegs.include?(peg) }
  end

  def self.random(length)
    valid_pegs = POSSIBLE_PEGS.keys
    new_pegs = []
    length.times { new_pegs << valid_pegs.sample }
    Code.new(new_pegs)
  end

  def self.from_string(str_pegs)
    Code.new(str_pegs.split(""))
  end

  def initialize(pegs)
    raise "invalid pegs" unless Code.valid_pegs?(pegs)
    @pegs = pegs.map(&:capitalize)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end
end
