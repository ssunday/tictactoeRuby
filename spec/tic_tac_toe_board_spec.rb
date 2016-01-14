require 'tic_tac_toe_board'

describe TicTacToeBoard do

  attr_reader :board, :player_one_marker, :player_two_marker
  before do
    @player_one_marker = "X"
    @player_two_marker = "O"
    @board = TicTacToeBoard.new
  end

  context "initial board" do

    it "is a default 0-8 board" do
        expect(board.current_board).to eql ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    end

    it "does not register as win" do
      expect(board.won?).to eq false
    end

    it "does not register as tie" do
      expect(board.tie?(player_one_marker: player_one_marker, player_two_marker: player_two_marker)).to eq false
    end

  end

  it "#set_board_location" do
    board.set_board_location(0,player_one_marker)
    expect(board.spot_value(0)).to eq player_one_marker
  end

  context "location already taken" do

    before do
      board.set_board_location(0,player_one_marker)
    end

    it "#location_valid_to_mark? returns false" do
      expect(board.location_valid_to_mark?(0, player_one_marker: player_one_marker, player_two_marker: player_two_marker)).to eq false
    end

  end

  context "location free" do

    it "#location_valid_to_mark? is true" do
      expect(board.location_valid_to_mark?(0, player_one_marker: player_one_marker, player_two_marker: player_two_marker)).to eq true
    end

  end

  context "tie board" do
    attr_reader :board_tie
    before do
      @board_tie = TicTacToeBoard.new(board: [\
        player_one_marker, player_two_marker, player_two_marker, \
        player_two_marker, player_one_marker, player_one_marker, \
        player_one_marker, player_two_marker, player_two_marker])
    end

    it "#tie? returns true" do
      expect(board_tie.tie?(player_one_marker: player_one_marker,player_two_marker: player_two_marker)).to eq true
    end

    it "#won? returns false" do
      expect(board_tie.won?).to eq false
    end

  end

  context "win board" do

    attr_reader :board_win
    before do
      @board_win = TicTacToeBoard.new(board: [\
        player_two_marker, "1", player_two_marker, \
        player_two_marker, player_one_marker, player_one_marker, \
        player_two_marker, "7", "8"])
    end

    it "#win? returns true" do
      expect(board_win.won?).to eq true
    end

    it "#tie? returns false" do
      expect(board_win.tie?(player_one_marker: player_one_marker, player_two_marker: player_two_marker)).to eq false
    end

  end

end
