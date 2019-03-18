require 'board'
require 'player'

class Game
    def initialize(board)
        @board = Board.new(board)
        @player = Player.new
        @current_player = @player.player1
    end

    def show_board
        @board.print_board
    end

    def current_player
        return @current_player
    end

    def make_move(position, player)
        if @board.is_valid_move(position) 
            @board.mark_board(position, @current_player)
            return true
        end
        return false
    end

    def has_player_won(mark)
        if @board.has_current_player_won(@current_player) == true
            return true
        end
        return false
    end

    def switch_player
        if @current_player == @player.player1
            @current_player = @player.player2
        else
            @current_player = @player.player1
        end
        return @current_player
    end

    def is_tie_or_is_won
        if @board.game_is_a_tie == true
            return "It's a tie!"
        elsif has_player_won(@current_player) == true
            return "#{@current_player} wins!"
        end
        return false
    end

    def game_can_continue
        if is_tie_or_is_won == false
            return true
        else
            return false
        end
    end
end