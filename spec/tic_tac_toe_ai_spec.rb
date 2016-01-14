require 'tic_tac_toe_ai'
require 'tic_tac_toe_board'
describe TicTacToeAi do
  attr_reader :other_player_marker, :ai_marker, :ai_player, :board
  before do
    @other_player_marker = "X"
    @ai_marker = "O"
    @ai_player = TicTacToeAi.new(ai_marker: @ai_marker, other_player_marker: @other_player_marker)
    @player_turn = other_player_marker
  end

  context "initial board" do
    attr_reader :init_board
    before do
      @init_board = TicTacToeBoard.new
    end

    it "on initial board is a corner spot" do
      expect(@ai_player.best_move(init_board, @player_turn)).to eq 0
    end

  end

  context "win scenario" do
    attr_reader :win_board
    before do
      @win_board = TicTacToeBoard.new(board: ["O", "O", "2", "3", "4", "5", "6", "7", "8"])
    end

    it "wins when player has two in a row already and the third is open" do
      expect(@ai_player.best_move(win_board, @player_turn)).to eq 2
    end

  end

  context "block scenario" do
    attr_reader :block_board
    before do
      @block_board = TicTacToeBoard.new(board: ["X", "X", "2", "3", "4", "5", "6", "7", "8"])
    end

    it "blocks when opponent has two in a row already and the third is open" do
      expect(@ai_player.best_move(block_board, @player_turn)).to eq 2
    end

  end

  context "win or block scenario" do
    attr_reader :win_block_board
    before do
      @win_block_board = TicTacToeBoard.new(board: ["X", "X", "2", "O", "O", "5", "X", "O", "X"])
    end

    it "chooses to win when there is an opportunity to win AND block" do
      expect(@ai_player.best_move(win_block_board, @player_turn)).to eq 2
    end

  end

end
