require 'tic_tac_toe_board'
require 'tic_tac_toe_player'

class TicTacToeRules
  attr_reader :player_turn, :player_one_marker, :player_two_marker
  def initialize(first_player, player_one, player_two)
    @player_turn = first_player
    @player_one_marker = player_one.get_marker
    @player_two_marker = player_two.get_marker
    @board = TicTacToeBoard.new
  end

  def game_turn(spot)
    @board.set_board_location(spot, player_turn)
  end

  def switch_turn
    if player_turn.eql?(player_two_marker)
      @player_turn = player_one_marker
    else
      @player_turn = player_two_marker
    end
  end

  def mark_board_location(spot, marker)
    @board.set_board_location(spot, marker)
  end

  def location_valid_to_mark?(spot)
    if @board.spot_value(spot) != player_two_marker && @board.spot_value(spot) != player_one_marker
      return true
    else
      return false
    end
  end

  def get_board
    @board
  end

  def get_player_one_marker
    player_one_marker
  end

  def get_player_two_marker
    player_two_marker
  end

  def display_game_board
    @board.display_board
  end

  def get_player_turn
    player_turn
  end

  def player_one_won?
    player_turn.eql?(player_two_marker) && @board.won?
  end

  def player_two_won?
    player_turn.eql?(player_one_marker) && @board.won?
  end

  def game_over?
    @board.won? || tied?
  end

  def tied?
    @board.tie?(player_one_marker: player_two_marker, player_two_marker: player_one_marker)
  end

end
