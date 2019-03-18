require 'game'

class Controller 
    def initialize(board)
        @game = Game.new(board)
        @current_player = @game.current_player
    end

    def take_turn(position)
        if @game.make_move(position, @current_player) == true && can_continue_playing == true
            toggle_player()
            return true
        else
            puts "invalid move"
            return false
        end
    end

    def prints_board
        @game.show_board
    end

    def toggle_player
        @game.switch_player
        @current_player = @game.current_player
    end

    def current_player
        @current_player
    end

    def can_continue_playing
        return @game.game_can_continue
    end
end
