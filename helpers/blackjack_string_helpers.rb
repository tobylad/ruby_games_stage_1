def win
  puts "Blackjack! You win!"
end

def bust
  puts "Bust! You lose!"
end

def dealer_blackjack_win
  puts "Dealer gets a blackjack - you lose!"
end

def dealer_win
  puts "Dealer wins!"
end

def dealer_bust
  puts "Dealer busts! You win!"
end

def both_scores(player_score, dealer_score)
  puts "Your score: #{player_score}"
  puts "Dealer score: #{dealer_score}"
end