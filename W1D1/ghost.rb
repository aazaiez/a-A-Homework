class Game
  attr_accessor :fragment, :dictionary, :current_player, :previous_player

  def initialize(player1, player2, dictionary = [])
    @fragment = ""
    @dictionary = dictionary_file if dictionary.empty?
    @current_player = Player.new(player1)
    @previous_player = Player.new(player2)
  end

  def play
    until win?
      take_turn(@current_player)
    end
    puts "#{@current_player} wins"
  end

  def current_player
    @current_player
  end

  def previous_player
    @previous_player
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def take_turn(player)
    best_guess = player.guess
    until valid_play?(best_guess)
      player.alert_invalid_guess
      best_guess = player.guess
    end
    @fragment += best_guess
  end

  def win?
    p @dictionary[0..20]
    return @dictionary.any?{|word| word == fragment}
  end

  def valid_play?(string)
    ["a".."z"].to_a.include?(string) && @dictionary.any?{|word| word[0..@fragment.length-1] == fragment} ? true : false
  end

  def dictionary_file
    words = []
    in_file = File.open("dictionary", "r")
    words = in_file.readlines
    in_file.close
    words.map! {|word| word[0..-2]}

    return words
  end

end

class Player
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def guess
    input = ""
    print "Enter a letter please "
    input = gets.chomp

    return input
  end

  def alert_invalid_guess
    puts "INVALID GUESS"
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new("Mario", "Luigi")
  game.play
end
