require_relative "game"
require_relative "card"

class Board
attr_accessor :grid, :length, :width

  def initialize(length = 6, width = 6)
    @grid = self.class.default_grid(length, width)
    @length = length
    @width = width
  end

  def valid_board?
    @length * @width % 2 == 0
  end

  def populate
    shuffled_board = []
    flattened_board = @grid.flatten
    num_pairs = flattened_board.length / 2
    0.upto(num_pairs - 1) do |idx|
      flattened_board[idx] = Card.new
      flattened_board[idx + num_pairs] = flattened_board[idx]
    end
    flattened_board.shuffle!
    flattened_board.each_slice(@length) { |el| shuffled_board << el }
    @grid = shuffled_board
  end

  def to_s
    new_arr = []
    clean_board = []
    flattened_board = @grid.flatten
    flattened_board.each do |el|
      new_arr << el.card_value
    end
    new_arr.each_slice(@length) { |el| clean_board << el }
    clean_board
  end

  def render

  end

  def won?
    @grid.flatten.all? { |el| el == "X" }
  end

  def [](pos1, pos2)
    @grid[pos1][pos2]
  end


  def reveal(length_pos, width_pos)
    @grid[length_pos][width_pos].card_value unless @grid[length_pos][width_pos].face_up == true
  end

  def self.default_grid(length, width)
    Array.new(length) { Array.new(width) }
  end



end
