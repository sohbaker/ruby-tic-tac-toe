class Computer
  attr_reader :mark, :opponent

  def initialize(mark, board)
    @mark = mark
    @board = board
  end

  def get_move
    analyse_board
  end

  def opponent_mark
    if @mark == "O"
      opponent = "X"
    else 
      opponent = "O"
    end
    opponent
  end

  def analyse_board
    current_board = @board.board_array
    best_play = nil 

    @board.available_moves.each do |space|
      @board.mark_board(space, @mark)
      if @board.current_player_wins?(@mark)
        best_play = space
        @board.clear_mark(space)
      else
        @board.clear_mark(space)
      end
      @board.mark_board(space, opponent_mark)
      if @board.current_player_wins?(opponent_mark)
        best_play = space
        @board.clear_mark(space)
      else
         @board.clear_mark(space)
      end 
     end
   
    if best_play 
      return best_play
    else
      @board.available_moves.sample
    end  
  end
end
