require 'TicTacToeRules.rb'

describe TicTacToeRules do

  before do
    human_marker = TicTacToePlayer.new("H")
    computer_marker = TicTacToePlayer.new("C")
    first_player = human_marker.get_marker
    @rules = TicTacToeRules.new(first_player, human_marker, computer_marker)
  end

  it "assigns computer marker" do
    expect(@rules.get_computer_marker()).to eq "C"
  end

  it "assigns human marker" do
    expect(@rules.get_human_marker()).to eq "H"
  end

  it "determines if spot is invalid" do
    @rules.mark_board_location(0,"H")
    expect(@rules.location_valid_to_mark?(0)).to eq false
  end

  it "determines a valid location" do
    expect(@rules.location_valid_to_mark?(0)).to eq true
  end

  it "switches the 'player turn'" do
    @rules.switch_turn
    expect(@rules.get_player_turn).to eq "C"
  end

  it "runs a game turn" do
    @rules.game_turn(0)
    expect(@rules.location_valid_to_mark?(0)).to eq false
    #expect(@rules.get_player_turn).to eq "C"
  end

  it "computers best move on initial board is the middle spot" do
    expect(@rules.get_computer_best_move).to eq 4
  end

end
