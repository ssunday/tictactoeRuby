require_relative 'tic_tac_toe_rules'
require_relative 'tic_tac_toe_ai'
require_relative 'tic_tac_toe_board'
require_relative 'tic_tac_toe_console_input_output'

class TicTacToeGame
  attr_reader :game, :ai_player, :rules

  def run_the_game
    play = true
    while play
      start_game
      play_game
      end_game
      play = @input_output.restart?
    end
    @input_output.thanks_for_playing_message
  end

  def start_game
    @input_output = TicTacToeConsoleInputOutput.new
    @input_output.start_up_message

    player_one_marker = @input_output.ask_for_player_one_marker
    player_two_marker = @input_output.ask_for_player_two_marker

    if @input_output.ai_player_one?
      @ai_player_one = TicTacToeAi.new(ai_marker: player_one_marker, other_player_marker: player_two_marker)
    end

    if @input_output.ai_player_two?
      @ai_player_two = TicTacToeAi.new(ai_marker: player_two_marker, other_player_marker: player_one_marker)
    end

    first_player = @input_output.ask_who_is_going_first
    @rules = TicTacToeRules.new(TicTacToeBoard.new, first_player: first_player, player_one: player_one_marker, player_two: player_two_marker)
    @input_output.end_start_up_message
  end

  def play_game
    @input_output.display_board(rules.board.board)
    until rules.game_over?
      current_board = TicTacToeBoard.new(board: Array.new(rules.board.board))
      if rules.player_turn.eql?(rules.player_one_marker)
        @input_output.report_current_turn_one
        if @ai_player_one != nil
          spot = @ai_player_one.best_move(current_board, rules.player_turn)
        else
          spot = @input_output.ask_player_for_location_to_mark
          while current_board.location_valid_to_mark?(location: spot, player_one_marker: rules.player_one_marker, player_two_marker: rules.player_two_marker) == false
            spot = @input_output.ask_player_for_location_to_mark
          end
        end
      else
        @input_output.report_current_turn_two
        if @ai_player_two != nil
          spot = @ai_player_two.best_move(current_board, rules.player_turn)
        else
          spot = @input_output.ask_player_for_location_to_mark
          while current_board.location_valid_to_mark?(location: spot, player_one_marker: rules.player_one_marker, player_two_marker: rules.player_two_marker) == false
            spot = @input_output.ask_player_for_location_to_mark
          end
        end
      end
      @input_output.report_location_marked(rules.player_turn, spot)
      rules.game_turn(spot)
      @input_output.display_board(rules.board.board)
    end
  end

  def end_game
    if rules.player_one_won?
      @input_output.game_over_player_one_won
    elsif rules.player_two_won?
      @input_output.game_over_player_two_won
    else
      @input_output.game_over_tied
    end
    @ai_player_one = nil
    @ai_player_two = nil
  end
end

game = TicTacToeGame.new
game.run_the_game
