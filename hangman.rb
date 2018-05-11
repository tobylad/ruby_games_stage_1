# Slices:
  # 1. Get complete game up and running with ONE simple word.
    # Progress: You can now win with the right guesses, and the word displays well.  However, losses are buggy.  Fix em!
  # 2. Add longer words.
  # 3. Add categories.

def run_hangman
  clear_screen
  play_hangman
end

def play_hangman
  clear_screen

  guesses_left = 5
  word = "cat"
  guessed_letters = []
  correct_letters = []
  wrong_letters = []
  
  while guesses_left > 0
    padding
    if guessed_letters.length == 0
      puts "3-letter word.  Guess your letter here!"
    else
      puts "Guess another letter!"
    end
    
    input = gets.chomp
    
    letter_validation(input, correct_letters)
    valid_guess = input.downcase
  
    if word.include?(valid_guess)
      guessed_letters << valid_guess
      correct_letters << valid_guess
      checkpoint = hangman_string(word, correct_letters).split.join
      
      return victory(word) if checkpoint == word
      puts "Yes!"
    elsif !word.include?(valid_guess)
      guessed_letters << valid_guess
      wrong_letters << valid_guess
      guesses_left -= 1
      puts "Guesses left: #{guesses_left}"
    end
    padding
    frame
    puts hangman_string(word, correct_letters)
    frame
  end
  
  
  #########################################
  
end

def hangman_string(word, correct_letters)
  # Start a string with all underscores
  current_word_state = Array.new(word.length, "_")
  display_word = current_word_state.join(' ')
  
  correct_letters.each do |letter| 
    indices = word.chars.each_index.select { |i| word[i] == letter }
      
    indices.each do |i|
      current_word_state.slice!(i)
      current_word_state.insert(i, word[i])
      display_word = current_word_state.join(' ')
    end
  end
  display_word
end

def victory(word)
  padding
  puts "#{word.chars.join(' ')}"
  puts "You won!"
end

def letter_validation(input, guessed_letters)
  return not_a_letter if !input.match(/[a-zA-Z]/)
  return just_one_letter if input.chars.length > 1
  return already_guessed if guessed_letters.include?(input.downcase)
end

def not_a_letter
  puts "That's not a letter!"
end

def just_one_letter
  puts "One letter at a time, cowboy!"
end

def already_guessed
  puts "You already guessed that letter!"
end
