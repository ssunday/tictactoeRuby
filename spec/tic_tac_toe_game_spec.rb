require 'tic_tac_toe_game'

describe TicTacToeGame do

  attr_reader :tictactoe_game

  before do
    @tictactoe_game = TicTacToeGame.new
  end

  context "game has started up" do

    it "#game_over is false" do
      expect(tictactoe_game.game_over?).to eq false
    end

  end

  context "game is over" do
    it "#game_over is true" do
      tictactoe_game.play_game
      expect(tictactoe_game.game_over?).to eq true
    end
  end

  it "plays game until game is over" do
    tictactoe_game.play_game
    expect(tictactoe_game.game_over?).to eq true
  end


end
