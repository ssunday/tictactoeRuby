require 'tic_tac_toe_game'

describe TicTacToeGame do

  before do
    @tictactoe = TicTacToeGame.new()
  end

  it "at start up says the game is not over" do
    expect(@tictactoe.gameOver?()).to eq false
  end

  it "returns true for when game is over" do
    @tictactoe.play_game
    expect(@tictactoe.gameOver?()).to eq true
  end

end
