require 'tic_tac_toe_rules'
require 'tic_tac_toe_player'
require 'tic_tac_toe_ai'

class TicTacToeGame
  attr_reader :game, :ai_player
  def initialize
    human_marker = "X"
    computer_marker = "O"
    first_player = human_marker
    player_one = TicTacToePlayer.new(computer_marker)
    player_two = TicTacToePlayer.new(human_marker)
    @ai_player = TicTacToeAi.new(ai_marker: computer_marker, other_player_marker: human_marker)
    @game = TicTacToeRules.new(first_player, player_one, player_two)
  end

  def play_game
    until game_over?
      if game.get_player_turn.eql?(game.get_player_one_marker)
        #In this case this is the 'human' player
        spot = ai_player.best_move(game.get_board, game.get_player_turn)
      else
        spot = ai_player.best_move(game.get_board, game.get_player_turn)
      end
      game.game_turn(spot)
    end
  end

  def game_over?()
    game.game_over?
  end

end
