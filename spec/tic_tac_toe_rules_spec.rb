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

  def simulate_win_scenario
    @rules.mark_board_location(0,"O")
    @rules.mark_board_location(1,"O")
    @rules.switch_turn
  end

  def simulate_block_scenario
    @rules.mark_board_location(0,"X")
    @rules.mark_board_location(1,"X")
    @rules.switch_turn
  end

  def simulate_win_block_scenario
    @rules.mark_board_location(0,"X")
    @rules.mark_board_location(1,"X")
    @rules.mark_board_location(6,"X")
    @rules.mark_board_location(3,"O")
    @rules.mark_board_location(4,"O")
    @rules.mark_board_location(7,"O")
    @rules.mark_board_location(8,"O")
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
    human_player = TicTacToePlayer.new("X")
    computer_player = TicTacToePlayer.new("O")
    first_player = human_player.get_marker
    @rules = TicTacToeRules.new(first_player, human_player, computer_player)
  end

  it "#get_computer_marker returns computer marker" do
    expect(@rules.get_computer_marker).to eq "O"

  end

  it "#get_human_marker returns human marker" do
    expect(@rules.get_human_marker).to eq "X"
  end

  context "location already taken" do

    before do
      @rules.mark_board_location(0,"X")

    end

    it "#location_valid_to_mark? returns false" do
      expect(@rules.location_valid_to_mark?(0)).to eq false
    end

  end

  context "location free" do

    it "#location_valid_to_mark? is true" do
      expect(@rules.location_valid_to_mark?(0)).to eq true
    end

  end

  it "#switch_turn" do
    @rules.switch_turn
    expect(@rules.get_player_turn).to eq "O"
  end

  it "#game_turn" do
    @rules.game_turn(0)
    expect(@rules.location_valid_to_mark?(0)).to eq false
  end

  context "#best move" do

    it "on initial board is a corner spot" do
      expect(@rules.best_move).to eq 0
    end

    it "wins when player has two in a row already and the third is open" do
      simulate_win_scenario
      expect(@rules.best_move).to eq 2
    end

    it "blocks when opponent has two in a row already and the third is open" do
      simulate_block_scenario
      expect(@rules.best_move).to eq 2
    end

    it "wins when there is an opportunity to win AND block" do
      simulate_win_block_scenario
      expect(@rules.best_move).to eq 2
    end

  end

  it "#get_possible_moves" do
    expect(@rules.get_possible_moves(@rules.get_board)).to eq ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  it "#switch_turn_minmax from human -> computer" do
    expect(@rules.switch_turn_minmax(@rules.get_human_marker)).to eq @rules.get_computer_marker
  end

  it "#switch_turn_minmax from computer -> human" do
    expect(@rules.switch_turn_minmax(@rules.get_human_marker)).to eq @rules.get_computer_marker
  end

  context "game over" do

    context "if human won" do

      before do
        simulate_win_by_human
      end

      it "#human_won? is true" do
        expect(@rules.human_won?).to eq true
      end

      it "#computer_won? is false" do
        expect(@rules.computer_won?).to eq false
      end

    end

    context "if computer won" do

      before do
        simulate_win_by_computer
      end

      it "#computer_won? is true" do
        expect(@rules.computer_won?).to eq true
      end

      it "#human_won? is false" do
        expect(@rules.human_won?).to eq false
      end

    end

    context "if game is tied" do
      before do
        simulate_tie
      end

      it "#tied? is true" do
        expect(@rules.tied?).to eq true
        #expect(@rules).to be_tied
      end

      it "#human_won? is false" do
        expect(@rules.human_won?).to eq false
      end

      it "#computer_won? is false" do
        expect(@rules.computer_won?).to eq false
      end

    end

  end

end
