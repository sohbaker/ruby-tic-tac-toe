require "computer"
require "spec_helper"
require "board"

RSpec.describe Computer do
  board = Board.new(empty_board)
  computer = Computer.new("O", board)

  it "creates a new computer player with a mark" do
    expect(computer.mark).to eq("O")
  end
  
  it "selects an available move from the board" do
    expect(computer.get_move.nil?).to eq(false)
  end

  it "blocks it's opponent from winning the game" do 
    board = Board.new(in_progress)
    computer = Computer.new("O", board)
    expect(computer.get_move).to eq("5")
  end
end
