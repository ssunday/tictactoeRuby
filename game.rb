#Tic Tac Toe Game
#Sarah Sunday

class TicTacToe
  #Constants to identify which player has won
  COMPUTER_PLAYER = "computer"
  HUMAN_PLAYER = "human"
  
  def initialize
    #Default values of board, markers, who goes first, and who has won.
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @human_marker = ""
    @computer_marker = ""
    @player_turn = ""
    @winner = ""
  end
  
  def run_game
    #Runs the game, executing all crucial functions and setting up the main game loop. 
    start_up
    game_loop
    game_over_screen    
  end

  def start_up
    #Initializes the critical values with console UI. Such as, the Human/Computer Markers and who is going first.
    puts "Welcome to the Tic Tac Toe Game.\nBefore we begin, I need to ask a few questions to setup the game."
    puts "What is your marker? (I.e like 'X', but can be any single letter excluding integers.)"
    human_symbol = gets.chomp
    puts "What is the computer's marker? (Make it different from your own.)"
    computer_symbol = gets.chomp
    while computer_symbol == human_symbol
      puts "Sorry, you need to make the computer's marker different from your own."
      puts "What is the computer's marker?"
      computer_symbol = gets.chomp
    end
    puts "Who is going first? (Type human for yourself, or computer for computer.)"
    first_player = gets.chomp.downcase
    while first_player != "human" && first_player != "computer"
      puts "Sorry, that was not valid. Please try again."
      puts "Who is going first? (Type human for yourself, or computer for computer.)"
      first_player = gets.chomp.downcase
    end
    assign_values(human_symbol,computer_symbol,first_player)
    puts "Thanks! That's it. Now you can play."
  end
  
  
  def assign_values(human,computer,firstplayer)
    #Directly assigns values for non-console UI. If so, then start_up has no need to be called in main game function.
    @human_marker = human
    @computer_marker = computer
    @player_turn = firstplayer
  end
    
  def display_board
    #Displays the game board as a string.
    puts "\n"\
    "   |   #{@board[0]}   |   #{@board[1]}   |   #{@board[2]}   |   \n"\
    "---|-------|-------|-------|--- \n"\
    "   |   #{@board[3]}   |   #{@board[4]}   |   #{@board[5]}   |   \n"\
    "---|-------|-------|-------|---\n"\
    "   |   #{@board[6]}   |   #{@board[7]}   |   #{@board[8]}   |   \n\n"
  end
  
  def human_turn(spot)
    #Assigns the passed in spot to the human marker.
    @board[spot] = @human_marker
  end
  
  def get_human_spot
    #The console input way for getting what spot to select
    spot = nil
    until spot
      puts "Please choose an open spot you want to mark by typing in the number (0-8)."
      spot = gets.chomp.to_i
      if !(@board[spot] != @computer_marker && @board[spot] != @human_marker) || !(spot <= 8 && spot >= 0)
        puts "Sorry, that is not a valid location."
        spot = nil
      end
    end
    return spot
  end
  
  def computer_turn
    #Calls function select what spot to mark and displays that spot.
    spot = get_best_move(@board)
    @board[spot] = @computer_marker
    puts "The Computer has selected spot #{spot}!"
  end

  def get_best_move(board)
    #Parameter is the game board as it currently is
    #Finds the best move for the Computer to make based on the current board.
    available_spaces = []
    best_move = nil
    if board[4] == "4"
      best_move = 4
      return best_move
    end
    2.times do
      board.each do |spot_content|
        if spot_content != @computer_marker && spot_content != @human_marker
          available_spaces << spot_content
        end
      end
      available_spaces.each do |available_spot|
        board[available_spot.to_i] = @computer_marker
        if if_someone_has_won(board)
          best_move = available_spot.to_i
          board[available_spot.to_i] = available_spot
          return best_move
        else
          board[available_spot.to_i] = @human_marker
          if if_someone_has_won(board)
            best_move = available_spot.to_i
            board[available_spot.to_i] = available_spot
            return best_move
          else
            board[available_spot.to_i] = available_spot
          end
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end
  
  def game_loop
    #Runs the game, alternating turns until the game has been won or tied.
    player_turn = @player_turn
    display_board
    until if_someone_has_won(@board) || check_if_tie(@board)
      if player_turn.eql?("computer")
        puts "COMPUTER'S TURN"
        computer_turn
        player_turn = "human"
      else
        puts "YOUR TURN"
        human_turn(get_human_spot)
        player_turn = "computer"
      end
      display_board
    end
    if if_someone_has_won(@board)
      if player_turn.eql?("human")
        @winner = COMPUTER_PLAYER
      elsif player_turn.eql?("computer")
        @winner = HUMAN_PLAYER
      end
    end
  end

  def if_someone_has_won(b)
    #Detects if the game has been won by either player.
    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end
  
  def check_if_tie(b)
    #Determines if a tie has occurred.
    b.all? { |spot| spot == @computer_marker|| spot == @human_marker }
  end
  
  def game_over_screen
    #Displays the appropriate end-of-game messages.
    if check_if_tie(@board) && !(if_someone_has_won(@board))
      puts "TIE!"
    elsif @winner.eql?("human")
      puts "You WON!"
    elsif @winner.eql?("computer")
      puts "The computer has won!"
    end
    puts "GAME IS OVER. Thanks for playing!"
  end
end

tictactoe = TicTacToe.new
tictactoe.run_game
