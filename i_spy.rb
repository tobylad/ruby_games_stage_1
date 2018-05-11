# Future improvements:
  # Logic for close guesses
  # Refactor for DRY
  # Additional categories

def run_i_spy
  clear_screen
  puts "Welcome to I Spy!"
  puts "Choose a category:"
  puts "1. In the classroom"
  puts "2. On the road"
  input = gets.chomp
  
  case input
    when "1"
      classroom_i_spy
    when "2"
      road_i_spy
    else 
      puts "That's not an option!"
      run_i_spy
  end
end

def directions(area)
  padding
  puts "Directions:"
  puts "Picture yourself #{area}.  Look around."
  puts "The CPU is there too, and they're looking at something of a certain color.  You have three chances to guess what it is!"
  
  padding
  puts "You ready, fren? (y/n/repeat)"
  input = gets.chomp
  
  case input
    when "y"
      puts "Here we go!"
    when "1"
      puts "Here we go!"
    when "n"
      puts "I guess you don't have what it takes!"
      padding
      game_selection
    when "repeat"
      directions(area)
    else
      puts "Huh?"
      directions(area)
  end
end

def classroom_i_spy
  directions("in a classroom")
  
  colored_classroom_things = {
    "yellow" => ["pencil", "post-it"],
    "blue" => ["globe", "water bottle"],
    "white" => ["paper", "whiteboard"],
    "brown" => ["desk", "shelf"]
  }
  
  cpu_color = colored_classroom_things.keys.sample
  answer = colored_classroom_things["#{cpu_color}"].sample
  
  padding
  puts "I spy, with my little eye, something..."
  sleep(0.5)
  puts "."
  sleep(0.5)
  puts ".."
  sleep(0.5)
  puts "..."
  sleep(0.5)
  padding
  puts "#{cpu_color}!"
  
  # sleep(2)
  padding
  
  puts "Do you know what it is?"
  
  guess_checker(answer)
  
  padding 
  
  again = play_again
  again == true ? run_i_spy : say_thanks

end

def road_i_spy
  directions("on the road")
  
  colored_road_things = {
    "red" => ["stop sign", "taillight"],
    "blue" => ["sky", "water bottle"],
    "white" => ["cloud", "lines"],
    "black" => ["rear view mirror", "tires"]
  }
  
  cpu_color = colored_road_things.keys.sample
  answer = colored_road_things["#{cpu_color}"].sample
  
  padding
  puts "I spy, with my little eye, something..."
  sleep(0.5)
  puts "."
  sleep(0.5)
  puts ".."
  sleep(0.5)
  puts "..."
  sleep(0.5)
  padding
  puts "#{cpu_color}!"
  
  # sleep(2)
  padding
  
  puts "Do you know what it is?"
  
  guess_checker(answer)
  
  padding 
  
  again = play_again
  again == true ? run_i_spy : say_thanks

end

# Game Helpers

def player_guess
  guess = gets.chomp
end

def guess_checker(answer)
  correct = false
  player_guesses = 0
  
  while correct == false && player_guesses < 3
    guess = player_guess
    
    if guess == answer
      player_guesses += 1
      puts "Wow, you got it! Great job!"
      correct = true
    elsif player_guesses == 2
      player_guesses += 1
      padding
      puts "Sorry, you didn't get it!"
      puts "The answer was #{answer}!"
    else
      player_guesses += 1
      puts "Guess again!"
    end
  end
end
