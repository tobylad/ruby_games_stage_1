require_relative "./helpers/blackjack_string_helpers"

def run_blackjack
  puts "Welcome to Blackjack!"
  play_blackjack
end

def play_blackjack

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
  while player_score <= 21 && stand == false

    if calculate_score(drawn_cards) == 21 && drawn_cards.length == 2
      player_score = calculate_score(drawn_cards)
      puts "Your current score is #{player_score}."
      stand = true
      win
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
          puts "Your current score is #{player_score}."
          bust if player_score > 21
          
          if player_score == 21
            stand = true
            win
          end

        when "stand"
          stand = true
          player_score = calculate_score(drawn_cards)
          "Your current score is #{player_score}."
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
    "Ace" => 11
  }
  random_card = cards.sample
  score_conversion.select { |card, value| card == random_card }
end

def calculate_score(drawn_cards)
  raw_scores = []

  # Assigns score based on card values
  drawn_cards.each do |pair|
    raw_scores << pair.values.first
  end

  # If player would bust but has an Ace in their hand, 
  # this conditional will change all Ace values from 11 to 1
  if raw_scores.reduce(:+) > 21 && raw_scores.include?(11)
    ace_indices = 
    raw_scores.each_index.select do |i|
      raw_scores[i] == 11
    end

    ace_indices.each do |i| 
      raw_scores.slice!(i)
      raw_scores << 1
    end

    raw_scores.reduce(:+)

  else
    raw_scores.reduce(:+)
  end
end

def hit_or_stand
  # Output: string
  puts "You're still under 21. Hit or stand?"
  input = gets.chomp
end

# Dealer helper methods **
def dealer_round
  possible_outcomes = [17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
  possible_outcomes.sample
end

def dealer_result(player_score, dealer_score)
  if dealer_score == 21
    both_scores(player_score, dealer_score)
    dealer_blackjack_win
  elsif dealer_score < 21 && dealer_score > player_score
    both_scores(player_score, dealer_score)
    dealer_win
  elsif dealer_score < 21 && dealer_score <= player_score
    both_scores(player_score, dealer_score)
    win
  elsif dealer_score > 21
    both_scores(player_score, dealer_score)
    dealer_bust
  end
end
