class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def guess
    alphabet = ("a".."z").to_a
    input = gets.chomp

    unless alphabet.include?(input)
      raise self.alert_invalid_guess
    end

    input
  end

  def alert_invalid_guess
    puts "Invalid input"
  end
end