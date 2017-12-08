require_relative "tile"

class Board
  attr_accessor :grid

  def initialize(grid = self.class.default_grid)
    @grid = grid

  end

  def self.default_grid
    Array.new(9) { Array.new(9) }
  end

  def update_value(pos, val)

  end

  def render

  end

  def solved?

  end


end
