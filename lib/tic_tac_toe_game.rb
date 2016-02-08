require_relative 'tic_tac_toe_rules'
require_relative 'tic_tac_toe_ai'
require_relative 'tic_tac_toe_board'
require_relative 'tic_tac_toe_console_input_output'
require_relative "tic_tac_toe_human_player.rb"

class TicTacToeGame
  attr_reader :rules

  def initialize(args = {})
    @input_output = args.fetch(:input_output, TicTacToeConsoleInputOutput.new)
    @player_one = nil
    @player_two = nil
    @rules = nil
  end

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
    @input_output.start_up_message

    player_one_marker = @input_output.ask_for_player_one_marker
    player_two_marker = @input_output.ask_for_player_two_marker(player_one_marker)
    isAI_one = @input_output.ai_player_one?
    isAI_two = @input_output.ai_player_one?
    create_player_one(isAI_one, player_one_marker, player_two_marker)
    create_player_two(isAI_two, player_one_marker, player_two_marker)
    first_player = @input_output.ask_who_is_going_first(player_one_marker, player_two_marker)
    @rules = TicTacToeRules.new(TicTacToeBoard.new, first_player: first_player, player_one: player_one_marker, player_two: player_two_marker)
    @input_output.end_start_up_message
  end


  def play_game(players = {})
    @player_one = players.fetch(:player_one, @player_one)
    @player_two = players.fetch(:player_two, @player_two)
    @input_output.display_board(rules.get_array_board)

    until rules.game_over?
      @input_output.report_current_turn(rules.player_turn)
      spot = get_spot
      @input_output.report_location_marked(rules.player_turn, spot)
      rules.game_turn(spot)
      @input_output.display_board(rules.get_array_board)
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
  end

  private

  def create_player_one(isAI, player_one_marker, player_two_marker)
    if isAI
      @player_one = TicTacToeAi.new(ai_marker: player_one_marker, other_player_marker: player_two_marker)
    else
      @player_one = TicTacToeHumanPlayer.new
    end
  end

  def create_player_two(isAI, player_one_marker, player_two_marker)
    if isAI
      @player_two = TicTacToeAi.new(ai_marker: player_two_marker, other_player_marker: player_one_marker)
    else
      @player_two = TicTacToeHumanPlayer.new
    end
  end

  def get_spot
    current_board = TicTacToeBoard.new(board: Array.new(rules.get_array_board))
    if rules.player_turn.eql?(rules.player_one_marker)
      @player_one.move(current_board, rules.player_turn)
    else
      @player_two.move(current_board, rules.player_turn)
    end
  end

end
