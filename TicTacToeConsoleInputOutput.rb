class TicTacToeConsoleInputOutput
  
  def start_up
    puts "Welcome to the Tic Tac Toe Game.\nBefore we begin, I need to ask a few questions to setup the game."
    human_marker = ask_for_human_marker
    computer_marker = ask_for_computer_marker(human_marker)
    first_player = get_who_is_going_first
    puts "Thanks! That's it. Now you can play."
    return [first_player, human_marker, computer_marker]
  end
  
  def ask_for_human_marker
    puts "What is your marker? (I.e like 'X', but can be any single letter excluding integers.)"
    human_marker = gets.chomp
    while human_marker =~ /\A\d+\z/ ? true : false
       puts "Sorry, you need to make your marker not an integer."
       puts "What is your marker? (I.e like 'X', but can be any single letter excluding integers.)"
       human_marker = gets.chomp
     end
    return human_marker
  end
  
  def ask_for_computer_marker(human_marker)
    puts "What is the computer's marker? (Make it different from your own.)"
    computer_marker = gets.chomp
    while computer_marker =~ /\A\d+\z/ ? true : false || computer_marker == human_marker
       puts "Sorry, you need to make the computer's marker not an integer and not the same as the human_marker."
       puts "What is the computer's marker? (Make it different from your own.)"
       computer_marker = gets.chomp
    end
    return computer_marker
  end
  
  def get_who_is_going_first
    puts "Who is going first? (Type human for yourself, or computer for computer.)"
    first_player = gets.chomp.downcase
    while first_player != "human" && first_player != "computer"
      puts "Sorry, that was not valid. Please try again."
      puts "Who is going first? (Type human for yourself, or computer for computer.)"
      first_player = gets.chomp.downcase
    end
    return first_player
  end
  
  def get_human_location_to_mark
    spot = nil
    until spot
      puts "Please choose an open spot you want to mark by typing in the number (0-8)."
      spot = gets.chomp
      if (spot =~ /\A\d+\z/ ? false : true) || spot.to_i > 8 || spot.to_i < 0 
        puts "Sorry, that is not a valid location."
        spot = nil
      end
    end
    return spot.to_i
  end
  
  def report_whose_turn_it_is(which_player)
    puts "It is the #{which_player} player's turn."
  end
  
  def report_location_marked(location, player)
    puts "The #{player} has selected spot #{location}!"
  end
  
  def game_over_screen_player_won
    puts "You WON!"
    puts "GAME IS OVER. Thanks for playing!"
  end
  
  def game_over_screen_computer_won
    puts "The computer has won!"
    puts "GAME IS OVER. Thanks for playing!"
  end
  
  def game_over_screen_tie
    puts "TIE!"
    puts "GAME IS OVER. Thanks for playing!"
  end
  
  def restart
    puts "Do you wish to play again? (yes/no)"
    play_again = gets.chomp
    while not(play_again.eql?("yes")) && not(play_again.eql?("no"))
      puts "Please select either yes or no."
      play_again = gets.chomp
    end
    if play_again.eql?("yes")
      return true
    else
      return false
    end
  end
end