class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false
    @sequence_length = 1
    @seq = []

  end

  def play
    take_turn until @game_over == true
    if @game_over == true
      game_over_message
      reset_game
    end

  end

  def take_turn
    show_sequence
    require_sequence
    # while @game_over == false
      round_success_message
      @sequence_length += 1
    # end
  end

  def show_sequence
    add_random_color

  end

  def require_sequence

  end

  def add_random_color
    @seq << COLORS[rand(4)]
  end

  def round_success_message

  end

  def game_over_message

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []

  end
end
