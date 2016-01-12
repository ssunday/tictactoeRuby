require 'tic_tac_toe_board'

describe TicTacToeBoard do

  before do
    @board = TicTacToeBoard.new()
  end

  def simulateTie()
    @board.set_board_location(0,"X")
    @board.set_board_location(1,"O")
    @board.set_board_location(2,"O")
    @board.set_board_location(3,"O")
    @board.set_board_location(4,"X")
    @board.set_board_location(5,"X")
    @board.set_board_location(6,"X")
    @board.set_board_location(7,"O")
    @board.set_board_location(8,"O")
  end

  def simulateWin()
    @board.set_board_location(0,"O")
    @board.set_board_location(3,"O")
    @board.set_board_location(6,"O")
  end

  it "initializes to default 0-8 board" do
      expect(@board.get_current_board()).to eql ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  it "returns correct spot value" do
    expect(@board.get_spot_value(0)).to eq "0"
  end

  it "correctly changes location to specific marker" do
    @board.set_board_location(0,"X")
    expect(@board.get_spot_value(0)).to eq "X"
  end

  it "correctly registers a tie" do
    simulateTie
    expect(@board.check_if_tie("X","O")).to eq true

  end

  it "registers a win" do
    simulateWin
    expect(@board.check_if_someone_has_won()).to eq true
  end

end
