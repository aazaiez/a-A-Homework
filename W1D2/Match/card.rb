

class Card
  attr_accessor :card_value, :face_up

  def initialize
    @face_up = false
    @card_value = rand(100)
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    self.card_value
  end

  def ==(other_card)
    self.card_value == other_card.card_value
  end
end
