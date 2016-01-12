#Tic Tac Toe Game
#Mock class to test methods

require_relative './TicTacToeRules'
require_relative './TicTacToePlayer'

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
    until gameOver?
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

  def markBoard(spot,marker)
    game.mark_board_location(spot,marker)
  end

  def switch_turn()
    game.switch_turn()
  end

  def gameOver?()
    someoneWon? || tied?
  end

  def someoneWon?()
    game.check_if_game_won
  end

  def tied?()
    game.check_if_game_tied
  end

  def playerWon?()
    game.get_player_turn.eql?(game.get_computer_marker) && game.check_if_game_won
  end

  def computerWon?()
    game.get_player_turn.eql?(game.get_human_marker) && game.check_if_game_won
  end
end
