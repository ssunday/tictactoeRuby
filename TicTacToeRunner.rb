#Tic Tac Toe Game Runner
#Sarah Sunday

require_relative './TicTacToeManager'
require_relative './TicTacToeConsoleInputOutput'

class TicTacToeGameRunner
  def play_game
    play = true
    console = TicTacToeConsoleInputOutput.new
    start_up_values = console.start_up
    while play
      game = TicTacToeManager.new(start_up_values[0], start_up_values[1], start_up_values[2])
      game.display_game_board
      until game.check_if_game_won || game.check_if_game_tie
        console.report_whose_turn_it_is(game.get_player_turn)
        if game.get_player_turn.eql?("human")
          spot = console.get_human_location_to_mark
          while game.test_if_location_valid_to_mark(spot)
            spot = console.get_human_location_to_mark
          end
        else
          spot = game.get_computer_best_move
        end
        console.report_location_marked(spot,game.get_player_turn)
        game.game_turn(spot, game.get_player_turn)
        game.display_game_board
      end
      if game.check_if_game_tie
        console.game_over_screen_tie
      else
        if game.get_player_turn.eql?("computer")
          console.game_over_screen_player_won
        else
          console.game_over_screen_computer_won
        end
      end
      play = console.restart
    end
  end
end

game = TicTacToeGameRunner.new
game.play_game
