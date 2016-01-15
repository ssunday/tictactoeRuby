require 'tic_tac_toe_rules'
require 'tic_tac_toe_ai'
require 'tic_tac_toe_board'

class TicTacToeGame
  attr_reader :game, :ai_player, :rules

  def initialize
    player_one_marker = "X"
    player_two_marker = "O"
    first_player = player_one_marker
    initial_board = TicTacToeBoard.new
    @ai_player = TicTacToeAi.new(ai_marker: player_one_marker, other_player_marker: player_two_marker)
    @rules = TicTacToeRules.new(initial_board, first_player: first_player, player_one: player_one_marker, player_two:player_two_marker)
  end

  def play_game
    until rules.game_over?
      if rules.player_turn.eql?(rules.player_one_marker)
        #In this case this is the 'human' player
        spot = ai_player.best_move(rules.board, rules.player_turn)
      else
        spot = ai_player.best_move(rules.board, rules.player_turn)
      end
      rules.game_turn(spot)
    end
  end

end
