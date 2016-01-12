#Tic Tac Toe Game
#Mock class to test methods

require 'tic_tac_toe_rules'
require 'tic_tac_toe_player'

class TicTacToeGame
  attr_reader :game
  def initialize
    human_marker = "X"
    computer_marker = "O"
    first_player = human_marker
    computer = TicTacToePlayer.new(computer_marker)
    human = TicTacToePlayer.new(human_marker)
    @game = TicTacToeRules.new(first_player, human, computer)
  end

  def play_game
    until game_over?
      if game.get_player_turn.eql?(game.get_human_marker)
        #In this case this is the 'human' player
        spot = game.get_computer_best_move
      else
        spot = game.get_computer_best_move
      end
      game.game_turn(spot)
    end
    #game.display_game_board
  end

  def game_over?()
    game.game_over?
  end

end
