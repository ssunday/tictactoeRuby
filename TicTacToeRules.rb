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
    if @player_turn.eql?(@computer_marker)
      @board.set_board_location(spot, @computer_marker)
      @player_turn = @human_marker
    else
      @board.set_board_location(spot, @human_marker)
      @player_turn = @computer_marker
    end
  end
   
  def test_if_location_valid_to_mark(spot)
    if !(@board.get_spot_value(spot) != @computer_marker && @board.get_spot_value(spot) != @human_marker)
      return true
    else
      return false
    end
  end
  
  def get_computer_marker
    return @computer_marker
  end
  
  def get_human_marker
    return @human_marker
  end
  
  def display_game_board
    @board.display_board
  end
  
  def get_player_turn
    return @player_turn
  end
  
  def check_if_game_won
    return @board.check_if_someone_has_won
  end
  
  def check_if_game_tied
    return @board.check_if_tie(@computer_marker, @human_marker)
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
end