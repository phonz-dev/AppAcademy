require "set"

class GhostGame
  def initialize(*players)
    file = File.open("dicitionary.txt")
    @dictionary = file.readlines.map(&:chomp).to_set
    @players = players
    @fragment = ""
  end
end