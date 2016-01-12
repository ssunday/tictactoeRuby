#Tic Tac Toe Game Execution
#Sarah Sunday
#Integrates the Rules and I/O to run the game of tic tac toe

#correctly does not work as have modified other files

require_relative './TicTacToeRules'
require_relative './TicTacToeConsoleInputOutput'
require_relative './TicTacToePlayer'

class TicTacToeGameExecution

  def play_game
    player_wants_to_play = true
    console_interface = TicTacToeConsoleInputOutput.new
    console_interface.start_up_message
    human_marker = console_interface.ask_for_human_marker
    computer_marker = console_interface.ask_for_computer_marker(human_marker)
    first_player = console_interface.ask_who_is_going_first(human_marker, computer_marker)
    console_interface.end_start_up_message
    computer = TicTacToePlayer.new(computer_marker)
    human = TicTacToePlayer.new(human_marker)
    while player_wants_to_play
      game = TicTacToeRules.new(first_player, human, computer)
      game.display_game_board
      until game.check_if_game_won || game.check_if_game_tied
        if game.get_player_turn.eql?(game.get_human_marker)
          console_interface.report_it_is_humans_turn
          spot = console_interface.ask_player_for_location_to_mark
          while game.test_if_location_valid_to_mark(spot)
            spot = console_interface.ask_player_for_location_to_mark
          end
          console_interface.report_human_location_marked(spot)
        else
          console_interface.report_it_is_computers_turn
          spot = game.get_computer_best_move
          console_interface.report_computer_location_marked(spot)
        end
        game.game_turn(spot)
        game.display_game_board
      end
      if game.check_if_game_tied
        console_interface.game_over_screen_tied
      else
        if game.get_player_turn.eql?(game.get_computer_marker)
          console_interface.game_over_screen_player_won
        else
          console_interface.game_over_screen_computer_won
        end
      end
      player_wants_to_play = console_interface.restart
    end
  end

end

game = TicTacToeGameExecution.new
game.play_game
