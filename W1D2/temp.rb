class Animals
  attr_accessor :inventory

  def initialize(inventory)
    @inventory = inventory
  end

  def [](pos)
    self.inventory[pos[0]][pos[1]]
  end

  def []=value
    self.inventory[]
  end
end
