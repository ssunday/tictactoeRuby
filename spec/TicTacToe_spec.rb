require 'TicTacToeGame.rb'

describe TicTacToeGame do

  before do
    @tictactoe = TicTacToeGame.new()
  end

  def simulateWinbyHuman()
    @tictactoe.markBoard(0,"X")
    @tictactoe.markBoard(1,"X")
    @tictactoe.markBoard(2,"X")
    @tictactoe.switch_turn
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
