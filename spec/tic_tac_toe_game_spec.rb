require 'tic_tac_toe_game'

describe TicTacToeGame do

  before do
    @tictactoe = TicTacToeGame.new()
  end

  context "game has started up" do

    it "#game_over is false" do
      expect(@tictactoe.game_over?()).to eq false
    end

  end

  context "game is over" do
    it "#game_over is true" do
      @tictactoe.play_game
      expect(@tictactoe.game_over?()).to eq true
    end
  end

  it "plays game until game is over" do
    @tictactoe.play_game
    expect(@tictactoe.game_over?()).to eq true
  end


end
