class TicTacToeMockHumanPlayer

  def move(board, current_player)
    available_spaces = get_possible_moves(board)
    available_spaces[rand(available_spaces.length)].to_i
  end

  def get_possible_moves(board)
    possible_spaces = []
    board.board.each do |space|
      if space.to_i < 8 && space.to_i > 0 && space =~ /\A\d+\z/ ? false : true
        possible_spaces << space
      end
    end
    possible_spaces
  end

end
