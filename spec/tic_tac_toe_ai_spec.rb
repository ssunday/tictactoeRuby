require 'tic_tac_toe_ai'
require 'tic_tac_toe_board'

describe TicTacToeAi do
  attr_reader :ai_player, :board, :player_turn
  before do
    other_player_marker = "X"
    ai_marker = "O"
    @ai_player = TicTacToeAi.new(ai_marker: ai_marker, other_player_marker: other_player_marker)
    @player_turn = other_player_marker
  end

  context "initial board" do
    attr_reader :init_board
    before do
      @init_board = TicTacToeBoard.new
    end

    it "#best_move is top left, aka 0" do
      expect(ai_player.best_move(init_board, player_turn)).to eq 0
    end

  end

  context "AI has two in a row already and the third is open" do
    attr_reader :win_board
    before do
      @win_board = TicTacToeBoard.new(board: ["O", "O", "2", "3", "4", "5", "6", "7", "8"])
    end

    it "#best_move chooses winning move" do
      expect(ai_player.best_move(win_board, player_turn)).to eq 2
    end

  end

  context "opponent has two in a row already and the third is open" do
    attr_reader :block_board
    before do
      @block_board = TicTacToeBoard.new(board: ["X", "X", "2", "3", "4", "5", "6", "7", "8"])
    end

    it "#best_move blocks the opponent by selecting the open spot" do
      expect(ai_player.best_move(block_board, player_turn)).to eq 2
    end

  end

  context "AI is given the choice of blocking the opponent from winning or winning itself" do

    attr_reader :win_block_board
    before do
      @win_block_board = TicTacToeBoard.new(board: ["X", "X", "2", "O", "O", "5", "X", "O", "X"])
    end

    it "#best_move prioritizes winning" do
      expect(ai_player.best_move(win_block_board, player_turn)).to eq 2
    end

  end

end
