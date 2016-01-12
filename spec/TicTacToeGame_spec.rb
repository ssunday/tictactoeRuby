require 'TicTacToeGame.rb'

describe TicTacToeGame do

  def simulateWinbyHuman()
    @tictactoe.mark_board(0,"X")
    @tictactoe.mark_board(1,"X")
    @tictactoe.mark_board(2,"X")
    @tictactoe.switch_turn #depends whose turn is first.
  end

  def simulateWinbyComputer
    @tictactoe.mark_board(0,"O")
    @tictactoe.mark_board(1,"O")
    @tictactoe.mark_board(2,"O")
  end

  def simulateTie()
    @tictactoe.mark_board(0,"X")
    @tictactoe.mark_board(1,"O")
    @tictactoe.mark_board(2,"O")
    @tictactoe.mark_board(3,"O")
    @tictactoe.mark_board(4,"X")
    @tictactoe.mark_board(5,"X")
    @tictactoe.mark_board(6,"X")
    @tictactoe.mark_board(7,"O")
    @tictactoe.mark_board(8,"O")
  end

  before do
    @tictactoe = TicTacToeGame.new()
  end

  context "start-up" do

    it "returns false for tied when game sets up" do
      expect(@tictactoe.tied?()).to eq false
    end

    it "says no one has won" do
      expect(@tictactoe.someoneWon?()).to eq false
    end
  end

  context "game over" do

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
