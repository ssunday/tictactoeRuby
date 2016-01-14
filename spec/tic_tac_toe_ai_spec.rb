require 'tic_tac_toe_ai'
require 'tic_tac_toe_board'
describe TicTacToeAi do

  attr_reader :human_marker, :computer_marker, :ai_player, :board
  before do
    @human_marker = "X"
    @computer_marker = "O"
    @ai_player = TicTacToeAi.new(@computer_marker, @human_marker)
    @player_turn = human_marker
    @board = TicTacToeBoard.new
  end

  def simulate_win_scenario
    board.set_board_location(0,computer_marker)
    board.set_board_location(1,computer_marker)
  end

  def simulate_block_scenario
    board.set_board_location(0,human_marker)
    board.set_board_location(1,human_marker)
    @player_turn = computer_marker
  end

  def simulate_win_block_scenario
    board.set_board_location(0,human_marker)
    board.set_board_location(1,human_marker)
    board.set_board_location(6,human_marker)
    board.set_board_location(3,computer_marker)
    board.set_board_location(4,computer_marker)
    board.set_board_location(7,computer_marker)
    board.set_board_location(8,computer_marker)
    @player_turn = computer_marker
  end

  context "Minmax ai player" do
    it "on initial board is a corner spot" do
      expect(@ai_player.best_move(board, @player_turn)).to eq 0
    end

    it "wins when player has two in a row already and the third is open" do
      simulate_win_scenario
      expect(@ai_player.best_move(board, @player_turn)).to eq 2
    end

    it "blocks when opponent has two in a row already and the third is open" do
      simulate_block_scenario
      expect(@ai_player.best_move(board, @player_turn)).to eq 2
    end

    it "wins when there is an opportunity to win AND block" do
      simulate_win_block_scenario
      expect(@ai_player.best_move(board, @player_turn)).to eq 2
    end
  end

end
