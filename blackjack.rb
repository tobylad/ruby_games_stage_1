# Fixes: Aces
  # Assign aces to 11's automatically
  # Write method for checking if there are aces in the hand (find?)
  # Write another method for changing the ace from 11 to 1
    # Keep auto busts (2 aces on deal) in mind

# Refactor for clarity, DRY

# Backlog:
  # More realistic decks, or logic around it 
    # Maybe card check (like for Aces), and if there are 4 don't draw that one?

def run_blackjack
  puts "Welcome to Blackjack!"
  play_blackjack
end

def play_blackjack
  # Notes about this method: Repeating line 'player_score = calc_score...'
  # is smelly.  But haven't figured out a workaround yet.

  padding
  drawn_cards = []
  # Dealer will deal here
  2.times { drawn_cards << draw_card }
  player_score = calculate_score(drawn_cards)
  stand = false

  puts "Dealing..."
  sleep(0.5)
  puts "."
  sleep(0.2)
  puts ".."
  sleep(0.2)
  puts "..."
  sleep(0.2)
  padding

  ### Start game loop ###
  while player_score < 21 && stand == false

    if calculate_score(drawn_cards) == 21
      player_score = calculate_score(drawn_cards)
      win
    elsif calculate_score(drawn_cards) > 21
      player_score = calculate_score(drawn_cards)
      bust
    else
      frame
      current_cards(drawn_cards)
      padding
      puts "Your current score: #{player_score}."
      frame
      next_move = hit_or_stand
      
      case next_move
        when "hit"
          drawn_cards << draw_card
          player_score = calculate_score(drawn_cards)
          bust if player_score > 21
          win if player_score == 21
        when "stand"
          stand = true
          player_score = calculate_score(drawn_cards)
          padding
        else
          "That doesn't make sense!"
      end
    end
  end
  ### End game loop ###

  if player_score < 21
    dealer_score = dealer_round 
    puts dealer_result(player_score, dealer_score)
  end

  padding
  again = play_again
  again == true ? run_blackjack : say_thanks
end

def current_cards(cards)
  puts "Your current cards:"
  cards.each { |card| puts card.keys.first }
end

def draw_card
  cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

  score_conversion = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "Jack" => 10,
    "Queen" => 10,
    "King" => 10,
    "Ace" => 1
  }
  random_card = cards.sample
  score_conversion.select { |card, value| card == random_card }
end

def calculate_score(drawn_cards)
  raw_scores = []

  drawn_cards.each do |pair|
    raw_scores << pair.values.first
  end
  raw_scores.reduce(:+)
end

def hit_or_stand
  # Output: string
  puts "You're still under 21. Hit or stand?"
  input = gets.chomp
  input
end

# Dealer helper methods **
def dealer_round
  possible_outcomes = [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]
  possible_outcomes.sample
end

def dealer_result(player_score, dealer_score)
  if dealer_score == 21
    dealer_win
  elsif dealer_score > 21
    dealer_bust
  end
end


# String helpers **
def win
  puts "Blackjack! You win!"
end

def bust
  puts "Bust! You lose!"
end

def dealer_win
  puts "Dealer gets a blackjack - you lose!"
end

def dealer_bust
  puts "Dealer busts! You win!"
end
