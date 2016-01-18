require 'tic_tac_toe_game'
require "tic_tac_toe_ai"
require "tic_tac_toe_mock_human_player"
require "tic_tac_toe_mock_io"

describe TicTacToeGame do

  attr_reader :tictactoe_game

  before do
    @tictactoe_game = TicTacToeGame.new(input_output: TicTacToeMockIO.new)
  end

  context "Nothing has been run" do

    it "rules is nil" do
      expect(tictactoe_game.rules).to eq nil
    end

  end

  describe "#start_game" do

    before do
      tictactoe_game.start_game
    end

    it "rules is initialized with a default board" do
      expect(tictactoe_game.rules.board.board).to eq ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    end

    it "#game_over is false" do
      expect(tictactoe_game.rules.game_over?).to eq false
    end

  end

  describe "#play_game" do

    before do
      tictactoe_game.start_game
    end

    it "#play_game until game is over" do
      tictactoe_game.play_game(player_two: TicTacToeMockHumanPlayer.new)
      expect(tictactoe_game.rules.game_over?).to eq true
    end

  end

  context "game is over" do
    
    before do
      tictactoe_game.start_game
    end

    it "#game_over is true" do
      tictactoe_game.rules.board.set_board_location(0, tictactoe_game.rules.player_turn)
      tictactoe_game.rules.board.set_board_location(1, tictactoe_game.rules.player_turn)
      tictactoe_game.rules.board.set_board_location(2, tictactoe_game.rules.player_turn)
      expect(tictactoe_game.rules.game_over?).to eq true
    end
  end

end
