# Future improvements
  # Difficulty (update computer throw arrays for each level)

def run_rps
  clear_screen
  puts "Welcome to Rock Paper Scissors!"
  puts "Would you like to play a single match or best of 3?"
  padding
  puts "1. Single match."
  puts "2. Best of 3."
  input = gets.chomp
  
  case input 
    when "1"
      play_single_round
    when "2"
      play_best_of_3
    else
      puts "That's not an option!"
      run_rps
  end
  
  padding 
  
  again = play_again
  again == true ? run_rps : say_thanks
end

def play_best_of_3
  player_score = 0
  cpu_score = 0
  
  until player_score == 2 || cpu_score == 2 
    result = play_single_round
    if result == "player"
      player_score += 1
    elsif result == "cpu"
      cpu_score += 1
    end
    padding
    current_score(player_score, cpu_score)
  end
  
  if player_score > cpu_score
    puts "You win the best of 3 match!"
  else
    puts "CPU wins the best of 3 match!"
  end
  
end

def current_score(player, cpu)
  puts "CURRENT SCORE"
  puts "Player: #{player}"
  puts "CPU: #{cpu}"
end

def play_single_round
  throws = ["rock", "paper", "scissors"]
  padding
  
  puts "Throw down, sucka!"
  puts "1. Rock"
  puts "2. Paper"
  puts "3. Scissors"
  input = gets.chomp
  
  case input
    when "1"
      player_throw = "rock"
    when "2"
      player_throw = "paper"
    when "3"
      player_throw = "scissors"
    when "4"
      player_throw = "Chuck Norris"
    else
      puts "That's not an option! Throw again!"
      return play_single_round
  end
  padding
  
  puts "Rock..."
  sleep(0.5)
  puts "Paper..."
  sleep(0.5)
  puts "Scissors..."
  sleep(0.5)
  puts "Shoot!"
  cpu_throw = throws.sample
  
  padding
  
  return puts "YOU WIN! CHUCK NORRIS BEATS ALL!" if player_throw == "Chuck Norris"

  return rock_outcomes(player_throw, cpu_throw) if player_throw == "rock"
  return paper_outcomes(player_throw, cpu_throw) if player_throw == "paper"
  return scissors_outcomes(player_throw, cpu_throw) if player_throw == "scissors"
  
end

def rock_outcomes(player, cpu)
  # Display the throws before calling out winner.
  frame
  puts "Your throw: #{player}"
  puts "CPU throw: #{cpu}"
  frame

  if player ==  "rock" && cpu == "scissors"
    puts "You win! Rock beats scissors!"
    winner = 'player'
  elsif player == "rock" && cpu == "paper"
    puts "You lose! Paper beats rock!"
    winner = 'cpu'
  elsif player == "rock" && cpu == "rock"
    puts "Draw game!"
    padding
    return play_single_round
  end

  winner
end

def paper_outcomes(player, cpu)
  # Display the throws before calling out winner.
  frame
  puts "Your throw: #{player}"
  puts "CPU throw: #{cpu}"
  frame

  if player ==  "paper" && cpu == "rock"
    puts "You win! Paper beats rock!"
    winner = 'player'
  elsif player == "paper" && cpu == "scissors"
    puts "You lose! Scissors beats paper!"
    winner = 'cpu'
  elsif player == "paper" && cpu == "paper"
    puts "Draw game!"
    padding
    return play_single_round
  end

  winner
end

def scissors_outcomes(player, cpu)
  # Display the throws before calling out winner.
  frame
  puts "Your throw: #{player}"
  puts "CPU throw: #{cpu}"
  frame

  if player ==  "scissors" && cpu == "paper"
    puts "You win! Scissors beats paper!"
    winner = 'player'
  elsif player == "scissors" && cpu == "rock"
    puts "You lose! Rock beats scissors!"
    winner = 'cpu'
  elsif player == "scissors" && cpu == "scissors"
    puts "Draw game!"
    padding
    return play_single_round
  end

  winner
end