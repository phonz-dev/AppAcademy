class Card
  attr_reader :value

  def initialize(value)
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
end