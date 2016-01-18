require 'tic_tac_toe_game'

describe TicTacToeGame do

  attr_reader :tictactoe_game

  before do
    @tictactoe_game = TicTacToeGame.new
  end

  context "Nothing has been run" do
    it "rules is nil" do
      expect(tictactoe_game.rules).to eq nil
    end
  end

  xcontext "game is over" do

    it "#game_over is true" do
      tictactoe_game.rules.board.set_board_location(0, tictactoe_game.rules.player_turn)
      tictactoe_game.rules.board.set_board_location(1, tictactoe_game.rules.player_turn)
      tictactoe_game.rules.board.set_board_location(2, tictactoe_game.rules.player_turn)
      expect(tictactoe_game.rules.game_over?).to eq true
    end

  end

  describe

  xit "#play_game until game is over" do
    tictactoe_game.play_game
    expect(tictactoe_game.rules.game_over?).to eq true
  end

end
