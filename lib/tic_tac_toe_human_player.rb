class TicTacToeHumanPlayer

  def move(board, current_player)
    spot = nil
    until spot
      puts "Please choose an open spot you want to mark by typing in the number (0-8)."
      spot = gets.chomp
      if valid_location?(spot)
        puts "Sorry, that is not a valid location."
        spot = nil
      end
    end
    spot.to_i
  end
  
  private

  def valid_location?(spot)
    spot =~ /\A\d+\z/ ? false : true || spot.to_i > 8 || spot.to_i < 0
  end

end
