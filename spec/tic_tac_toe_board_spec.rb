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
  
  context "initial board" do

    it "initializes to default 0-8 board" do
        expect(@board.current_board()).to eql ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    end

    it "does not register a win" do
      expect(@board.won?).to eq false
    end

    it "does not register a tie" do
      expect(@board.tie?("X","O")).to eq false
    end

  end

  it "#spot_value" do
    expect(@board.spot_value(0)).to eq "0"
  end

  it "#set_board_location" do
    @board.set_board_location(0,"X")
    expect(@board.spot_value(0)).to eq "X"
  end

  context "tie board" do

    it "#tie?" do
      simulateTie
      expect(@board.tie?("X","O")).to eq true
    end

    it "#does not register a tie as a win" do
      simulateTie
      expect(@board.won?).to eq false
    end

  end

  context "win board" do

    it "#win?" do
      simulateWin
      expect(@board.won?).to eq true
    end

    it "does not register a tie" do
      simulateWin
      expect(@board.tie?("X","O")).to eq false
    end

  end

end
