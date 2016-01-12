#Tic Tac Toe Rules
#Sarah Sunday
#Manages the rules and gameplay of tic tac toe

require_relative './TicTacToeBoard'
require_relative './TicTacToePlayer'

class TicTacToeRules

  def initialize(first_player, human, computer)
    @player_turn = first_player
    @computer_marker = computer.get_marker
    @human_marker = human.get_marker
    @board = TicTacToeBoard.new
  end

  def game_turn(spot)
    @board.set_board_location(spot, @player_turn)
    switch_turn()
  end

  def switch_turn()
    if @player_turn.eql?(@computer_marker)
      @player_turn = @human_marker
    else
      @player_turn = @computer_marker
    end
  end

  def mark_board_location(spot, marker)
    @board.set_board_location(spot, marker)
  end

  def location_valid_to_mark?(spot)
    if @board.get_spot_value(spot) != @computer_marker && @board.get_spot_value(spot) != @human_marker
      return true
    else
      return false
    end
  end

  def get_computer_marker
    @computer_marker
  end

  def get_human_marker
    @human_marker
  end

  def display_game_board
    @board.display_board
  end

  def get_player_turn
    @player_turn
  end

  def human_won?
    @player_turn.eql?(@computer_marker) && @board.check_if_someone_has_won
  end

  def computer_won?
    @player_turn.eql?(@human_marker) && @board.check_if_someone_has_won
  end

  def check_if_game_won
    @board.check_if_someone_has_won
  end

  def check_if_game_tied
    @board.check_if_tie(@computer_marker, @human_marker)
  end

  def get_computer_best_move
    available_spaces = []
    best_move = nil
    board_new = @board.clone
    if board_new.get_spot_value(4) == "4"
      best_move = 4
      return best_move
    end
    board_new.get_current_board.each do |spot_content|
      if spot_content != @computer_marker && spot_content != @human_marker
        available_spaces << spot_content
      end
    end
    available_spaces.each do |available_spot|
      board_new.set_board_location(available_spot.to_i, @human_marker)
      if board_new.check_if_someone_has_won
        best_move = available_spot.to_i
        board_new.set_board_location(available_spot.to_i, available_spot)
        return best_move
      else
        board_new.set_board_location(available_spot.to_i, @computer_marker)
        if board_new.check_if_someone_has_won
          best_move = available_spot.to_i
          board_new.set_board_location(available_spot.to_i, available_spot)
          return best_move
        else
          board_new.set_board_location(available_spot.to_i, available_spot)
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def get_possible_moves(board)
    possible_spaces = []
    board.get_current_board.each do |spot|
      if spot != @computer_marker && spot != @human_marker
        possible_spaces << spot_content
      end
    end
  end

  def computer_minimax
    highest_score = 9e99
    best_move = nil
    available_spaces = []
    available_spaces = get_possible_moves(@board)
    available_spaces.each do |available_spot|

    end
  end

  def max
    best_score = -1
    available_spaces = []
    available_spaces = get_possible_moves(@board)
    available_spaces.each do |available_spot|

    end
  end

end