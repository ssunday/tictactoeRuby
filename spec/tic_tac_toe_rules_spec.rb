require 'tic_tac_toe_rules'
require 'tic_tac_toe_ai'
describe TicTacToeRules do

  attr_reader :player_one_marker, :player_two_marker, :rules
  before do
    @player_one_marker = "X"
    @player_two_marker = "O"
    first_player = @player_one_marker
    @rules = TicTacToeRules.new(first_player, @player_one_marker, @player_two_marker)
  end

  def simulate_win_by_player_one
    rules.mark_board_location(0,player_one_marker)
    rules.mark_board_location(1,player_one_marker)
    rules.mark_board_location(2,player_one_marker)
    rules.switch_turn #depends whose turn is first.
  end

  def simulate_win_by_player_two
    rules.mark_board_location(0,player_two_marker)
    rules.mark_board_location(1,player_two_marker)
    rules.mark_board_location(2,player_two_marker)
  end

  def simulate_tie
    rules.mark_board_location(0,player_one_marker)
    rules.mark_board_location(1,player_two_marker)
    rules.mark_board_location(2,player_two_marker)
    rules.mark_board_location(3,player_two_marker)
    rules.mark_board_location(4,player_one_marker)
    rules.mark_board_location(5,player_one_marker)
    rules.mark_board_location(6,player_one_marker)
    rules.mark_board_location(7,player_two_marker)
    rules.mark_board_location(8,player_two_marker)
  end

  it "#switch_turn succesfully switches player turn" do
    rules.switch_turn
    expect(rules.player_turn).to eq player_two_marker
  end

  describe "#game_turn" do

    before do
      rules.game_turn(0)
    end

    it "makes it invalid to mark" do
      expect(rules.board.location_valid_to_mark?(0, player_one_marker: player_one_marker, player_two_marker: player_two_marker)).to eq false
    end

    it "changes it to player one's marker" do
      expect(rules.board.spot_value(0)).to eq player_one_marker
    end

  end


  context "game over" do

    context "if player one won" do

      before do
        simulate_win_by_player_one
      end

      it "#player_one_won? is true" do
        expect(rules.player_one_won?).to eq true
      end

      it "#player_two_won? is false" do
        expect(rules.player_two_won?).to eq false
      end

    end

    context "if player two won" do

      before do
        simulate_win_by_player_two
      end

      it "#player_two_won? is true" do
        expect(rules.player_two_won?).to eq true
      end

      it "#player_one_won? is false" do
        expect(rules.player_one_won?).to eq false
      end

    end

    context "if game is tied" do
      before do
        simulate_tie
      end

      it "#tied? is true" do
        expect(rules.tied?).to eq true
      end

      it "#player_one_won? is false" do
        expect(rules.player_one_won?).to eq false
      end

      it "#player_two_won? is false" do
        expect(rules.player_two_won?).to eq false
      end

    end

  end

end
