
class TicTacToeAi

  attr_reader :ai_marker, :other_player_marker

  def initialize(ai_marker, other_player_marker)
    @ai_marker = ai_marker
    @other_player_marker = other_player_marker
  end

  def switch_turn(current_player)
    if current_player.eql?(ai_marker)
      other_player_marker
    else
      ai_marker
    end
  end

  def human_won?(board, current_player)
    current_player.eql?(ai_marker) && board.won?
  end

  def computer_won?(board, current_player)
    current_player.eql?(other_player_marker) && board.won?
  end

  def game_over?(board)
    board.won? || tied?(board)
  end

  def tied?(board)
    board.tie?(player_one_marker: ai_marker, player_two_marker: other_player_marker)
  end

  def best_move(board, initial_player)
    best_move = nil
    best_score = -1e100
    available_spaces = []
    available_spaces = get_possible_moves(board)

    current_player = initial_player

    available_spaces.each do |space|
      current_board = board.dup
      current_board.set_board_location(space.to_i, current_player)
      current_player = switch_turn(current_player)
      this_score = minmax(current_board, current_player, 0)
      if this_score > best_score
        best_score = this_score
        best_move = space.to_i
      end
    end

    best_move

  end

  def get_possible_moves(board)
    possible_spaces = []
    board.current_board.each do |space|
      if board.location_valid_to_mark?(space.to_i, player_one_marker: ai_marker, player_two_marker: other_player_marker)
        possible_spaces << space
      end
    end
    return possible_spaces
  end

  def game_score(board, current_player, depth)
    if computer_won?(board, current_player)
      if current_player.eql?(ai_marker)
        return 10 - depth
      else
        return depth - 10
      end
    elsif human_won?(board, current_player)
      if current_player.eql?(ai_marker)
        return depth - 10
      else
        return 10 - depth
      end
    else
      return 0
    end
  end

  def minmax(board, current_player, depth)

    if game_over?(board)
      return game_score(board, current_player, depth)
    end

    if current_player != ai_marker
      multiplier = -1
    else
      multiplier = 1
    end

    best_score = -1e100
    available_spaces = get_possible_moves(board)

    available_spaces.each do |move|

      board_new = board.dup
      board_new.set_board_location(move.to_i, current_player)
      new_player = switch_turn(current_player)
      this_score = multiplier * minmax(board_new, new_player, depth + 1)
      if this_score >= best_score
        best_score = this_score
      end
    end

    return best_score

  end

end
