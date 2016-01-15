require 'tic_tac_toe_board'

class TicTacToeRules
  attr_reader :player_turn, :player_one_marker, :player_two_marker, :board
  def initialize(first_player, player_one, player_two)
    @player_turn = first_player
    @player_one_marker = player_one
    @player_two_marker = player_two
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

  def display_game_board
    @board.display_board
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
