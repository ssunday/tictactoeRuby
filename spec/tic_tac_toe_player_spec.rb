require 'tic_tac_toe_player'

describe TicTacToePlayer do

  before do
    @general_player = TicTacToePlayer.new("H")
  end

  it "assigns marker" do
    expect(@general_player.get_marker()).to eq "H"
  end
end
