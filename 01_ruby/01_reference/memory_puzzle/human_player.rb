class HumanPlayer
  def get_input
    gets.chomp.split(",")
  end

  def prompt
    print "Please enter the position of the card you'd like to flip (e.g., '2,3') \n> "
  end
end