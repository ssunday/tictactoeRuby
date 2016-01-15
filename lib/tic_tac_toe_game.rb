require 'tic_tac_toe_rules'
require 'tic_tac_toe_ai'

class TicTacToeGame
  attr_reader :game, :ai_player
  def initialize
    player_one_marker = "X"
    player_two_marker = "O"
    first_player = player_one_marker
    @ai_player = TicTacToeAi.new(ai_marker: player_one_marker, other_player_marker: player_two_marker)
    @game = TicTacToeRules.new(first_player, player_one_marker, player_two_marker)
  end

  def play_game
    until game_over?
      if game.player_turn.eql?(game.player_one_marker)
        #In this case this is the 'human' player
        spot = ai_player.best_move(game.board, game.player_turn)
      else
        spot = ai_player.best_move(game.board, game.player_turn)
      end
      game.game_turn(spot)
    end
  end

  def game_over?()
    game.game_over?
  end

end
