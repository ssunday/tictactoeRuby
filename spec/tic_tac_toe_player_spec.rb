require 'tic_tac_toe_player'

describe TicTacToePlayer do

  before do
    @human_marker = TicTacToePlayer.new("H")
    @computer_marker = TicTacToePlayer.new("C")
  end

  it "correctly assigns computer marker" do
    expect(@computer_marker.get_marker()).to eq "C"
  end

  it "correctly assigns human marker" do
    expect(@human_marker.get_marker()).to eq "H"
  end
end
