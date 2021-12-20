class Card
  attr_accessor :value

  def initialize(value = nil)
    @value, @face_up =  value, false
  end

  def flip
    self.face_up? ? self.hide : self.reveal
  end

  def face_up?
    @face_up
  end

  def reveal
    @face_up = true
  end

  def hide
    @face_up = false
  end

  def to_s
    self.face_up? ? @value : " "
  end

  def ==(other_card)
    self.value == other_card.value
  end
end