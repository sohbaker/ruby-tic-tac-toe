class Board
  attr_reader :grid

  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8],
  ]

  PLAYER_MARKS = ["X", "O"]

  def initialize
    @grid = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end
  
  def mark_board(move, mark)
    position = move.to_i - 1
    @grid[position] = mark.upcase
    @grid
  end
 
  def clear_mark(move)
    position = move.to_i - 1
    @grid[position] = move
  end

  def get_opponent_mark(given_mark)
    PLAYER_MARKS.find { |player_mark| player_mark != given_mark }
  end

  def available_moves
    available_moves = []
    @grid.each do |spot|
      if spot != "X" && spot != "O"
        available_moves.push(spot)
      end
    end
    available_moves
  end

  def valid?(move)
    move_as_integer = move.to_i
    available_moves.include?(move_as_integer)
  end

  def player_wins?(mark)
    WINNING_COMBINATIONS.any? do |combination|
      combination.all? { |position| @grid[position] == mark.upcase }
    end
  end

  def full?
    available_moves.empty?
  end
end
