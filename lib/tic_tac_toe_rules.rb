require 'tic_tac_toe_board'
require 'tic_tac_toe_player'

class TicTacToeRules

  def initialize(first_player, human, computer)
    @player_turn = first_player
    @computer_marker = computer.get_marker
    @human_marker = human.get_marker
    @board = TicTacToeBoard.new
  end

  def game_turn(spot)
    @board.set_board_location(spot, @player_turn)
  end

  def switch_turn
    if @player_turn.eql?(@computer_marker)
      @player_turn = @human_marker
    else
      @player_turn = @computer_marker
    end
  end

  def switch_turn_minmax(current_player)
    if current_player.eql?(@computer_marker)
      @human_marker
    else
      @computer_marker
    end
  end


  def mark_board_location(spot, marker)
    @board.set_board_location(spot, marker)
  end

  def location_valid_to_mark?(spot)
    if @board.spot_value(spot) != @computer_marker && @board.spot_value(spot) != @human_marker
      return true
    else
      return false
    end
  end

  def get_board
    @board
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
    @player_turn.eql?(@computer_marker) && @board.won?
  end

  def human_won_minmax?(board,current_player)
    current_player.eql?(@computer_marker) && board.won?
  end

  def computer_won?
    @player_turn.eql?(@human_marker) && @board.won?
  end

  def computer_won_minmax?(board, current_player)
    current_player.eql?(@human_marker) && board.won?
  end

  def game_won?
    @board.won?
  end

  def game_over?
    game_won? || tied?
  end

  def game_over_minmax?(board)
    board.won? || tied_minmax(board)
  end

  def tied_minmax(board)
    board.tie?(@computer_marker, @human_marker)

  end

  def tied?
    @board.tie?(@computer_marker, @human_marker)
  end

 # def computer_best_move
 #    available_spaces = []
 #    best_move = nil
 #    board_new = @board.clone
 #    if board_new.spot_value(4) == "4"
 #      best_move = 4
 #      return best_move
 #    end
 #    board_new.current_board.each do |spot_content|
 #      if spot_content != @computer_marker && spot_content != @human_marker
 #        available_spaces << spot_content
 #      end
 #    end
 #    available_spaces.each do |available_spot|
 #      board_new.set_board_location(available_spot.to_i, @human_marker)
 #      if board_new.won?
 #        best_move = available_spot.to_i
 #        board_new.set_board_location(available_spot.to_i, available_spot)
 #        return best_move
 #      else
 #        board_new.set_board_location(available_spot.to_i, @computer_marker)
 #        if board_new.won?
 #          best_move = available_spot.to_i
 #          board_new.set_board_location(available_spot.to_i, available_spot)
 #          return best_move
 #        else
 #          board_new.set_board_location(available_spot.to_i, available_spot)
 #        end
 #      end
 #    end
 #
 #    if best_move
 #      return best_move
 #    else
 #      n = rand(0..available_spaces.count)
 #      return available_spaces[n].to_i
 #    end
 #
 #  end

  def best_move
    best_move = nil
    best_score = -1e100
    available_spaces = []
    available_spaces = get_possible_moves(@board)

    current_player = @player_turn

    available_spaces.each do |move|
      current_board = @board.dup
      current_board.set_board_location(move.to_i, current_player)
      current_player = switch_turn_minmax(current_player)
      this_score = minmax(current_board, current_player, 0)
      if this_score > best_score
        best_score = this_score
        best_move = move.to_i
      end

    end

    best_move

  end

  def get_possible_moves(board)
    possible_spaces = []
    board.current_board.each do |spot|
      if spot != @computer_marker && spot != @human_marker
        possible_spaces << spot
      end
    end
    return possible_spaces
  end

  def game_score(board, current_player, depth)
    if computer_won_minmax?(board, current_player)
      if current_player.eql?(@computer_marker)
        return 10 - depth
      else
        return depth - 10
      end
    elsif human_won_minmax?(board, current_player)
      if current_player.eql?(@computer_marker)
        return depth - 10
      else
        return 10 - depth
      end
    else
      return 0
    end
  end

  def minmax(board, current_player, depth)

    if game_over_minmax?(board)
      return game_score(board, current_player, depth)
    end

    if current_player != @player_turn
      multiplier = -1
    else
      multiplier = 1
    end

    best_score = -1e100
    available_spaces = get_possible_moves(board)

    available_spaces.each do |move|

      board_new = board.dup
      board_new.set_board_location(move.to_i, current_player)
      new_player = switch_turn_minmax(current_player)
      this_score = multiplier * minmax(board_new, new_player, depth + 1)
      if this_score >= best_score
        best_score = this_score
      end
    end

    return best_score

  end

end
