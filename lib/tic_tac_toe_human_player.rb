class TicTacToeHumanPlayer

  def move(board, current_player)
    spot = nil
    until spot != nil
      puts "Please choose an open spot you want to mark by typing in the number (0-8)."
      spot = gets.chomp
    end
    spot.to_i
  end

end
