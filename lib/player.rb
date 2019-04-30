require "human"
require "computer"

attr_reader :player_1 :player_2

class Player  
  def initialize(game_type, board)
    @type = game_type 
    @board = board
  end
 
  def validate_type
    until @type == "hh" || @type == "hc"
      @display.notify_invalid("choice")
      @type = @display.take_input
    end
  end 

  def create_players
    if @type == "hh"
      @player_1 = Human.new("X")
      @player_2 = Human.new("O")
    else 
      @player_1 = Human.new("X")
      @player_2 = Computer.new("O", @board)
    end
  end 
end