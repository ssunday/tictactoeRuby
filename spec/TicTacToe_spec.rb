require 'TicTacToeGame.rb'
require 'TicTacToeBoard.rb'
require 'TicTacToeRules.rb'
require 'TicTacToePlayer.rb'

describe TicTacToeGame do

  def simulateWinbyHuman()
    @tictactoe.markBoard(0,"X")
    @tictactoe.markBoard(1,"X")
    @tictactoe.markBoard(2,"X")
    @tictactoe.switch_turn #depends whose turn is first.
  end

  def simulateWinbyComputer
    @tictactoe.markBoard(0,"O")
    @tictactoe.markBoard(1,"O")
    @tictactoe.markBoard(2,"O")
  end

  def simulateTie()
    @tictactoe.markBoard(0,"X")
    @tictactoe.markBoard(1,"O")
    @tictactoe.markBoard(2,"O")
    @tictactoe.markBoard(3,"O")
    @tictactoe.markBoard(4,"X")
    @tictactoe.markBoard(5,"X")
    @tictactoe.markBoard(6,"X")
    @tictactoe.markBoard(7,"O")
    @tictactoe.markBoard(8,"O")
  end

  context "Tic Tac Toe Board" do

    before do
      @board = TicTacToeBoard.new()
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

  end
  context "Tic Tac Toe Player" do
    before do
      @human_marker = TicTacToePlayer.new("H")
      @computer_marker = TicTacToePlayer.new("C")
    end

    it "correctly assigns computer marker" do
      expect(@computer_marker.get_marker()).to eq "C"
    end

    it "correctly assigns human marker" do
      expect(@human_marker.get_marker()).to eq "H"
    end
  end

  context "Tic Tac Toe Rules" do
    before do
      human_marker = TicTacToePlayer.new("H")
      computer_marker = TicTacToePlayer.new("C")
      first_player = human_marker
      @rules = TicTacToeRules.new(first_player, human_marker, computer_marker)
    end

    it "correctly assigns computer marker" do
      expect(@rules.get_computer_marker()).to eq "C"
    end

    it "correctly assigns human marker" do
      expect(@rules.get_human_marker()).to eq "H"
    end
    #TO DO
    #Mark location
    #Game won/tied
    #Computer move?
    #valid location
    #game turn
  end

  context "Tic Tac Toe Game Runner" do
    before do
      @tictactoe = TicTacToeGame.new()
    end
    describe "start-up" do
      it "returns false for tied when game sets up" do
        expect(@tictactoe.tied?()).to eq false
      end

      it "says no one has won" do
        expect(@tictactoe.someoneWon?()).to eq false
      end
    end

    describe "game over" do
      it "returns true for when game is over" do
        @tictactoe.play_game
        expect(@tictactoe.gameOver?()).to eq true
      end

      it "returns true for tied when game is tied" do
        simulateTie
        expect(@tictactoe.tied?()).to eq true
      end

      context "if game has been won by" do
        it "player" do
          simulateWinbyHuman
          expect(@tictactoe.playerWon?()).to eq true
        end

        it "computer" do
          simulateWinbyComputer
          expect(@tictactoe.computerWon?()).to eq true
        end
      end
    end
  end
end
