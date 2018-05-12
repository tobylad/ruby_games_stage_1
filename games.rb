# Terminal 'styling' helpers and universal prompts.

def game_selection
  clear_screen
  puts "What game would you like to play? (press q + enter to exit)"
  puts "1. Mad Libs"
  puts "2. Rock Paper Scissors"
  puts "3. I Spy"
  puts "4. Hangman"
  puts "5. Tic Tac Toe"
  puts "6. Blackjack"
  
  what_game = gets.chomp
  
  case what_game 
  when "q"
    puts "Thank you for playing!"
  when "1"
    run_mad_libs
  when "2"
    run_rps
  when "3"
    run_i_spy
  when "4"
    run_hangman
  when "5"
    run_tictactoe
  when "6"
    run_blackjack
  else
    puts "Not a valid option."
  end
end

def play_again
  puts "Would you like to play again?"
  puts "1. Yes"
  puts "2. No"
  puts "3. Main menu"
  input = gets.chomp
  
  case input
    when "3"
      return game_selection
    when "1"
      true
    when "2"
      false
  end
end

def say_thanks
  puts "Thanks for playing, fren!"
end

# Styling helpers
def padding
  puts ""
  puts ""
end

def frame 
  puts ""
  puts "=============================================="
  puts ""
end

def clear_screen
  puts "\e[H\e[2J"
end