require 'tic_tac_toe_rules'

describe TicTacToeRules do

  def simulate_win_by_human
    @rules.mark_board_location(0,"X")
    @rules.mark_board_location(1,"X")
    @rules.mark_board_location(2,"X")
    @rules.switch_turn #depends whose turn is first.
  end

  def simulate_win_by_computer
    @rules.mark_board_location(0,"O")
    @rules.mark_board_location(1,"O")
    @rules.mark_board_location(2,"O")
  end

  def simulate_tie
    @rules.mark_board_location(0,"X")
    @rules.mark_board_location(1,"O")
    @rules.mark_board_location(2,"O")
    @rules.mark_board_location(3,"O")
    @rules.mark_board_location(4,"X")
    @rules.mark_board_location(5,"X")
    @rules.mark_board_location(6,"X")
    @rules.mark_board_location(7,"O")
    @rules.mark_board_location(8,"O")
  end

  before do
    human_marker = TicTacToePlayer.new("X")
    computer_marker = TicTacToePlayer.new("O")
    first_player = human_marker.get_marker
    @rules = TicTacToeRules.new(first_player, human_marker, computer_marker)
  end

  it "assigns computer marker" do
    expect(@rules.get_computer_marker).to eq "O"
  end

  it "assigns human marker" do
    expect(@rules.get_human_marker).to eq "X"
  end

  it "determines if spot is invalid" do
    @rules.mark_board_location(0,"X")
    expect(@rules.location_valid_to_mark?(0)).to eq false
  end

  it "determines a valid location" do
    expect(@rules.location_valid_to_mark?(0)).to eq true
  end

  it "switches the 'player turn'" do
    @rules.switch_turn
    expect(@rules.get_player_turn).to eq "O"
  end

  it "runs a game turn" do
    @rules.game_turn(0)
    expect(@rules.location_valid_to_mark?(0)).to eq false
  end

  it "computers best move on initial board is the middle spot" do
    expect(@rules.get_computer_best_move).to eq 4
  end

  context "game over" do
    context "if game has been won by" do

      it "player" do
        simulate_win_by_human
        expect(@rules.human_won?).to eq true
      end

      it "computer" do
        simulate_win_by_computer
        expect(@rules.computer_won?).to eq true
      end
    end

    it "if game is tied" do
      simulate_tie
      expect(@rules.tied?).to eq true
      expect(@rules).to be_tied
    end
  end

end
