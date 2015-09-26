class TicTacToeComputerPlayer
  
  def get_best_move(board, computer_marker, human_marker)
    #Parameter is the game board as it currently is
    available_spaces = []
    best_move = nil
    if board[4] == "4"
      best_move = 4
      return best_move
    end
    2.times do
      board.each do |spot_content|
        if spot_content != computer_marker && spot_content != human_marker
          available_spaces << spot_content
        end
      end
      available_spaces.each do |available_spot|
        board[available_spot.to_i] = computer_marker
        if if_someone_has_won(board)
          best_move = available_spot.to_i
          board[available_spot.to_i] = available_spot
          return best_move
        else
          board[available_spot.to_i] = human_marker
          if if_someone_has_won(board)
            best_move = available_spot.to_i
            board[available_spot.to_i] = available_spot
            return best_move
          else
            board[available_spot.to_i] = available_spot
          end
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
