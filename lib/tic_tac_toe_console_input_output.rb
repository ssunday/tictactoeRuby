class TicTacToeConsoleInputOutput

  def start_up_message
    puts "Welcome to the Tic Tac Toe Game.\nBefore we begin, I need to ask a few questions to setup the game."
  end

  def end_start_up_message
    puts "Thanks! That's it. Now you can play."
  end

  def ai_player_one?
    puts "Do you wish for player one to be an AI? If no, they will be a human player. (y/n)"
    response = gets.chomp
    while response != "y" && response != "n"
      puts "Sorry, that was an invalid option."
      puts "Do you wish for player one to be an AI? If no, they will be a human player. (y/n)"
      response = gets.chomp
    end
    response.eql?("y")
  end

  def ai_player_two?
    puts "Do you wish for player two to be an AI? If no, they will be a human player. (y/n)"
    response = gets.chomp
    while response != "y" && response != "n"
      puts "Sorry, that was an invalid option."
      puts "Do you wish for player two to be an AI? If no, they will be a human player. (y/n)"
      response = gets.chomp
    end
    response.eql?("y")
  end

  def ask_for_player_one_marker
    puts "What is player one's marker? (I.e like 'X', but can be any single letter excluding integers.)"
    player_one_marker = gets.chomp
    while player_one_marker =~ /\A\d+\z/ ? true : false || player_one_marker.length != 1
       puts "Sorry, that marker was invalid."
       puts "What is player one's marker? (I.e like 'X', but can be any single letter excluding integers.)"
       player_one_marker = gets.chomp
    end
    player_one_marker
  end

  def ask_for_player_two_marker(player_one_marker)
    puts "What is player two's marker? (Make it different from player one's.)"
    player_two_marker = gets.chomp
    while player_two_marker =~ /\A\d+\z/ ? true : false || player_two_marker.eql?(player_one_marker) || player_two_marker.length != 1
       puts "Sorry, that marker was invalid."
       puts "What is the player two's marker? (Make it different from player one's, a single letter, and not a number.)"
       player_two_marker = gets.chomp
    end
    player_two_marker
  end

  def ask_who_is_going_first(player_one_marker, player_two_marker)
    puts "Which player is going first? (Type that player's marker to have them go first.)"
    first_player = gets.chomp
    while !(first_player.eql?(player_one_marker)) && !(first_player.eql?(player_two_marker))
      puts "Sorry, that was not valid. Please try again."
      puts "Which player is going first? (Type that player's marker to have them go first.)"
      first_player = gets.chomp
    end
    first_player
  end

  def report_current_turn(player_marker)
    puts "\nCurrent Player Marker: #{player_marker}"
  end

  def report_location_marked(current_player, location)
    puts "\n#{location} has been marked with an #{current_player}!"
  end

  def display_board(board)
    puts "\n"\
    "   |   #{board[0]}   |   #{board[1]}   |   #{board[2]}   |   \n"\
    "---|-------|-------|-------|--- \n"\
    "   |   #{board[3]}   |   #{board[4]}   |   #{board[5]}   |   \n"\
    "---|-------|-------|-------|---\n"\
    "   |   #{board[6]}   |   #{board[7]}   |   #{board[8]}   |   \n\n"
  end

  def game_over_player_one_won
    puts "Player one has WON!"
    puts "GAME IS OVER. Thanks for playing!"
  end

  def game_over_player_two_won
    puts "Player two has WON!"
    puts "GAME IS OVER. Thanks for playing!"
  end

  def game_over_tied
    puts "TIE!"
    puts "GAME IS OVER."
  end

  def thanks_for_playing_message
    puts "Thanks for playing!"
  end

  def restart?
    puts "Do you wish to play again? (y/n)"
    play_again = gets.chomp
    while not(play_again.eql?("y")) && not(play_again.eql?("n"))
      puts "Please select either y or n."
      play_again = gets.chomp
    end
    play_again.eql?("y")
  end

end
