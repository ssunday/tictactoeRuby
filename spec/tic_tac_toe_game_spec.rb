require 'tic_tac_toe_game'

xdescribe TicTacToeGame do

  attr_reader :tictactoe_game

  before do
    @tictactoe_game = TicTacToeGame.new
  end

  context "game has started up" do
    it "#game_over is false" do
      expect(tictactoe_game.rules.game_over?).to eq false
    end
  end

  context "game is over" do

    it "#game_over is true" do
      tictactoe_game.rules.board.set_board_location(0, tictactoe_game.rules.player_turn)
      tictactoe_game.rules.board.set_board_location(1, tictactoe_game.rules.player_turn)
      tictactoe_game.rules.board.set_board_location(2, tictactoe_game.rules.player_turn)
      expect(tictactoe_game.rules.game_over?).to eq true
    end

  end

  it "#play_game goes until game is over" do
    tictactoe_game.play_game
    expect(tictactoe_game.rules.game_over?).to eq true
  end

end
