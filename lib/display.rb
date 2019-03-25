class Display
  attr_reader :game

  def greet_players(game)
    @game = game
    puts "Welcome to Tic Tac Toe"
    puts "To make a move enter the number of the position you want to play"
    puts "Player1's mark is 'X' and Player2's mark is 'O'"
    puts "The game will end either when a player wins by placing their mark across a row, column or diagonally, or all the positions are taken\n"
  end

  def prompt_player
    print "\nPlayer #{@game.current_player}, make a move: "
  end

  def get_move(board)
    @game.board.board
    prompt_player
    input = gets.chomp
    while !valid?(input, board)
      puts "Invalid move"
      prompt_player
      input = gets.chomp
    end
    input
  end

  def valid?(input, board)
    board.available_moves.include?(input)
  end

  def announce_tie
    "It's a tie!"
  end

  def announce_win
    " wins!"
  end
end
