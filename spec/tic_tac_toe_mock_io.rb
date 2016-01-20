class TicTacToeMockIO
  def start_up_message
  end

  def end_start_up_message
  end

  def ai_player_one?
    true
  end

  def ai_player_two?
    false
  end

  def ask_for_player_one_marker
    "X"
  end

  def ask_for_player_two_marker(player_one_marker)
    "O"
  end

  def ask_who_is_going_first(player_one_marker, player_two_marker)
    player_one_marker
  end

  def ask_player_for_location_to_mark
  end

  def report_current_turn_one
  end

  def report_current_turn_two
  end

  def report_location_marked(current_player, location)
  end

  def display_board(board)
  end

  def game_over_player_one_won
  end

  def game_over_player_two_won
  end

  def game_over_tied
  end

  def thanks_for_playing_message
  end

  def restart?
    false
  end

end
