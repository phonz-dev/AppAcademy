class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(pegs)
    (0...pegs.length).all? { |i| Code::POSSIBLE_PEGS.include?(pegs[i].upcase) }
  end

  def self.random(length)
    rand_pegs = Array.new(length) { Code::POSSIBLE_PEGS.keys.sample }
    Code.new(rand_pegs)
  end

  def self.from_string(str_pegs)
    Code.new(str_pegs.split(""))
  end

  def initialize(pegs)
    raise "invalid pegs" unless Code.valid_pegs?(pegs)
    @pegs = pegs.map(&:upcase)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    match_count = 0
    @pegs.each_with_index do |peg, i|
      match_count += 1 if peg == guess[i]
    end
    match_count
  end

  def num_near_matches(guess)
    secret_pegs, guess_pegs = remove_exact_matches(@pegs, guess.pegs)

    near_match_count = 0
    seen = []

    secret_pegs.each do |peg|
      if guess_pegs.include?(peg) && !seen.include?(peg)
        near_match_count += 1
        seen << peg
      end
    end

    near_match_count
  end

  def remove_exact_matches(pegs_1, pegs_2)
    pegs_1_dup = pegs_1.dup
    pegs_2_dup = pegs_2.dup

    pegs_1_dup.each_with_index do |peg, i|
      if peg == pegs_2_dup[i]
        pegs_1_dup[i] = nil
        pegs_2_dup[i] = nil
      end
    end

    [pegs_1_dup.compact, pegs_2_dup.compact]
  end

  def ==(code)
    @pegs == code.pegs
  end
end

