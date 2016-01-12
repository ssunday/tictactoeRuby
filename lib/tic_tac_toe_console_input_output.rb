#Tic Tac Toe Console Input Output
#Sarah Sunday
#Creates functions to display output and get input via console

class TicTacToeConsoleInputOutput
  
  def start_up_message
    puts "Welcome to the Tic Tac Toe Game.\nBefore we begin, I need to ask a few questions to setup the game."
  end
  
  def end_start_up_message
    puts "Thanks! That's it. Now you can play."
  end
  
  def ask_for_human_marker
    puts "What is your marker? (I.e like 'X', but can be any single letter excluding integers.)"
    human_marker = gets.chomp
    while human_marker =~ /\A\d+\z/ ? true : false || human_marker.length != 1
       puts "Sorry, that marker was invalid."
       puts "What is your marker? (I.e like 'X', but can be any single letter excluding integers.)"
       human_marker = gets.chomp
     end
    return human_marker
  end
  
  def ask_for_computer_marker(human_marker)
    puts "What is the computer's marker? (Make it different from your own.)"
    computer_marker = gets.chomp
    while computer_marker =~ /\A\d+\z/ ? true : false || computer_marker == human_marker || computer_marker.length != 1
       puts "Sorry, that marker was invalid."
       puts "What is the computer's marker? (Make it different from your own, a single letter, and not a number.)"
       computer_marker = gets.chomp
    end
    return computer_marker
  end
  
  def ask_who_is_going_first(human_marker, computer_marker)
    puts "Who is going first? (Type your marker for yourself or the computer marker for computer.)"
    first_player = gets.chomp
    while !(first_player.eql?(human_marker)) && !(first_player.eql?(computer_marker))
      puts "Sorry, that was not valid. Please try again."
      puts "Who is going first? (Type your marker for yourself or the computer marker for computer.)"
      first_player = gets.chomp
    end
    return first_player
  end

  def ask_player_for_location_to_mark
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
  
  def report_it_is_humans_turn
    puts "It is your turn."
  end
  
  def report_it_is_computers_turn
    puts "It is the computer player's turn."
  end
  
  def report_human_location_marked(location)
    puts "You have selected spot #{location}!"
  end
  
  def report_computer_location_marked(location)
    puts "The computer has selected spot #{location}!"
  end
  
  def game_over_screen_player_won
    puts "You WON!"
    puts "GAME IS OVER. Thanks for playing!"
  end
  
  def game_over_screen_computer_won
    puts "The computer has won!"
    puts "GAME IS OVER. Thanks for playing!"
  end
  
  def game_over_screen_tied
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