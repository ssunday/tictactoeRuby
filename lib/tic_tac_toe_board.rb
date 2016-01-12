#TicTacToe Board
#Sarah Sunday
#Creates a class which represents the tic tac toe board. Has functions to alter it and test for its current state.

class TicTacToeBoard

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def set_board_location(location, marker)
    @board[location] = marker
  end

  def display_board
    puts "\n"\
    "   |   #{@board[0]}   |   #{@board[1]}   |   #{@board[2]}   |   \n"\
    "---|-------|-------|-------|--- \n"\
    "   |   #{@board[3]}   |   #{@board[4]}   |   #{@board[5]}   |   \n"\
    "---|-------|-------|-------|---\n"\
    "   |   #{@board[6]}   |   #{@board[7]}   |   #{@board[8]}   |   \n\n"
  end

  def spot_value(spot)
    @board[spot]
  end

  def current_board
    @board
  end

  def won?
    [@board[0], @board[1], @board[2]].uniq.length == 1 ||
    [@board[3], @board[4], @board[5]].uniq.length == 1 ||
    [@board[6], @board[7], @board[8]].uniq.length == 1 ||
    [@board[0], @board[3], @board[6]].uniq.length == 1 ||
    [@board[1], @board[4], @board[7]].uniq.length == 1 ||
    [@board[2], @board[5], @board[8]].uniq.length == 1 ||
    [@board[0], @board[4], @board[8]].uniq.length == 1 ||
    [@board[2], @board[4], @board[6]].uniq.length == 1
  end

  def tie?(computer_marker, human_marker)
    @board.all? { |spot| spot == computer_marker || spot == human_marker }
  end

end
