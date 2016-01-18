require_relative "tic_tac_toe_game.rb"

class TicTacToeGameRunner

  def initialize

    game = TicTacToeGame.new
    game.run_the_game
  end

end

game_runner = TicTacToeGameRunner.new
