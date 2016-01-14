require 'tic_tac_toe_board'

describe TicTacToeBoard do
  attr_reader :board, :player_one_marker, :player_two_marker
  before do
    @player_one_marker = "X"
    @player_two_marker = "O"
    @board = TicTacToeBoard.new
  end

  def simulateTie
    board.set_board_location(0,player_one_marker)
    board.set_board_location(1,player_two_marker)
    board.set_board_location(2,player_two_marker)
    board.set_board_location(3,player_two_marker)
    board.set_board_location(4,player_one_marker)
    board.set_board_location(5,player_one_marker)
    board.set_board_location(6,player_one_marker)
    board.set_board_location(7,player_two_marker)
    board.set_board_location(8,player_two_marker)
  end

  def simulateWin
    board.set_board_location(0,player_two_marker)
    board.set_board_location(3,player_two_marker)
    board.set_board_location(6,player_two_marker)
  end

  context "initial board" do

    it "initializes to default 0-8 board" do
        expect(board.current_board).to eql ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    end

    it "does not register a win" do
      expect(board.won?).to eq false
    end

    it "does not register a tie" do
      expect(board.tie?(player_one_marker: player_one_marker, player_two_marker: player_two_marker)).to eq false
    end

  end

  it "#spot_value" do
    expect(board.spot_value(0)).to eq "0"
  end

  it "#set_board_location" do
    board.set_board_location(0,player_one_marker)
    expect(board.spot_value(0)).to eq player_one_marker
  end

  context "tie board" do

    it "#tie?" do
      simulateTie
      expect(board.tie?(player_one_marker: player_one_marker,player_two_marker: player_two_marker)).to eq true
    end

    it "#does not register a tie as a win" do
      simulateTie
      expect(board.won?).to eq false
    end

  end

  context "win board" do

    it "#win?" do
      simulateWin
      expect(board.won?).to eq true
    end

    it "does not register a tie" do
      simulateWin
      expect(board.tie?(player_one_marker: player_one_marker,player_two_marker:player_two_marker)).to eq false
    end

  end

end
