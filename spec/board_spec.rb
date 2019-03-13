require 'board'

RSpec.describe Board do
  it "prints out a new board" do
    board = Board.new
    expect(board.print_board).to eq("""
        1 | 2 | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9""")
  end

  it "adds a mark to a board" do
    board = Board.new
    expect(board.mark_board(1, 'x')).to eq("""
        x | 2 | 3
        ---------
        4 | 5 | 6
        ---------
        7 | 8 | 9""")
  end

  it "checks whether a move is valid" do
    board = Board.new
    board.mark_board(1, 'x')
    expect(board.is_valid_move(1)).to eq(false)
  end
end
