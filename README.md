# tictactoeRuby
Tic Tac Toe Game in Ruby

Version 2.0

The Rules class is for general game rules and board interaction. It has no interaction with I/O; that is handled through the Runner Class

Console I/O class handles all gets and puts and displays (excluding board, which is in the Board class.)

The Player class holds the player's marker identification.

The Board class holds information on the current game board and has functions to modify it and report on whether someone has won or if the game is tied.

The Game Execution class handles the actual running of the game from a console stand point. It runs the loop and goes through the turns. It essentially integrates the I/O portion with the game manager.


Changes from 1.1:

    Split the game into four classes. Board, Player, Game Execution, Rules, and Console I/O.

    Added the ability to replay the game.
    
    Checked marker length to make sure it is only a single character.
    
    
    
Version 1.1

Generally played through console, but has some capabilities to do a non-console based UI.

Changes from original:

	Cleaned up the console display board.
	
	Added some checks for correct user input. Program will re-query user if submitted incorrect input.
	
	User can now select custom markers for themselves or computer.
	
	Changed variable names to be more sensible.
	
	Attempted to refine the computer's move selection process to be more difficult.
	
	Displayed messages saying whose turn it is and what the computer selected.
	
	Displays game-over messages such as tie or win/loss.
	
	Decoupled a few functions from each other to make it more modular.
	
	Made the Computer slightly more difficult to beat.
