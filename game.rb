#Tic Tac Toe Game
#Sarah Sunday
#Creates a text based version of TicTacToe

class Game
  
  def initialize
    #Default values.
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @human_marker = ""
    @computer_marker = ""
    @first_player = 0
    @winner = 0
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
    hum = gets.chomp
    puts "What is the computer's marker? (Make it different from your own.)"
    com = gets.chomp
    while com == hum
      puts "Sorry, you need to make the computer's marker different from your own."
      puts "What is the computer's marker?"
      com = gets.chomp
    end
    puts "Who is going first? (Type 1 for yourself, 2 for computer.)"
    first_player = gets.chomp
    #1 will mean the Human player goes first, 2 the computer player.
    while first_player != "1" && first_player != "2"
      puts "Sorry, that was not valid. Please try again."
      puts "Who is going first? (Type 1 for yourself, 2 for computer.)"
      first_player = gets.chomp
    end
    assign_values(hum,com,first_player.to_i)
    puts "Thanks! That's it. Now you can play."
  end
  
  
  def assign_values(human,computer,firstplayer)
    #Directly assigns values for non-console UI. If so, then start_up has no need to be called in main game function.
    @human_marker = human
    @computer_marker = computer
    @first_player = firstplayer
  end
    
  def display_board
    #Displays the board, inserting the respective values into the string.
    puts ""\
    "   |   #{@board[0]}   |   #{@board[1]}   |   #{@board[2]}   |   \n"\
    "---|-------|-------|-------|--- \n"\
    "   |   #{@board[3]}   |   #{@board[4]}   |   #{@board[5]}   |   \n"\
    "---|-------|-------|-------|---\n"\
    "   |   #{@board[6]}   |   #{@board[7]}   |   #{@board[8]}   |   \n"
  end
  
  def human_turn(spot)
    #Assigns the passed in spot to the human marker
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
    #Displays what spot has been seleceted.
    spot = get_best_move(@board)
    @board[spot] = @computer_marker
    puts "The Computer has selected spot #{spot}!"
  end

  def get_best_move(board)
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
        if game_is_over(board)
          best_move = available_spot.to_i
          board[available_spot.to_i] = available_spot
          return best_move
        else
          board[available_spot.to_i] = @human_marker
          if game_is_over(board)
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
    counter = @first_player
    display_board
    until game_is_over(@board) || tie(@board)
      if counter.even?
        puts "COMPUTER'S TURN"
        computer_turn
      else
        puts "YOUR TURN"
        human_turn(get_human_spot)
      end
      display_board
      counter = counter.next
    end
    if game_is_over(@board)
      if counter.odd?
        @winner = 2
      elsif counter.even?
        @winner = 1
      end
    end
  end

  def game_is_over(b)
    #Detects if the game has been won
    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end
  
  def tie(b)
    #Determines if a tie has been made.
    b.all? { |s| s == @computer_marker|| s == @human_marker }
  end
  
  def game_over_screen
    #Displays the appropriate end-of-game messages.
    if tie(@board) && !(game_is_over(@board))
      puts "TIE!"
    elsif @winner == 1
      puts "You WON!"
    elsif @winner == 2
      puts "The computer has won!"
    end
    puts "GAME IS OVER. Thanks for playing!"
  end
end

game = Game.new
game.run_game
