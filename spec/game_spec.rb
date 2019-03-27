require "game"
require "pseudo_moves"

RSpec.describe Game do
  # game should switch the players, halt an invalid move, end the game, or let the game continue

  it "switches the player" do
    game = Game.new
    game.make_move(1)
    expect(game.toggle_player).to eq("O")
  end

  it "halts an invalid move" do
  end

  it "knows that the game can continue" do
    game = Game.new
    game.make_move(1)
    game.make_move(2)
    expect(game.over?).to eq(false)
  end

  it "knows the game has ended with a tie" do
    moves = PseudoMoves::TIED_GAME_SEQUENCE
    game = Game.new
    until moves.empty?
      game.make_move(moves.shift)
      game.toggle_player
    end
    expect(game.is_a_tie?).to eq(true)
  end

  it "knows when a player has won the game" do
    moves = PseudoMoves::X_WINS_SEQUENCE
    game = Game.new
    until moves.empty?
      game.make_move(moves.shift)
      if !game.over?
        game.toggle_player
      end
    end
    expect(game.player_wins?(game.current_player)).to be(true)
  end
end
