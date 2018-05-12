require_relative "./helpers/hangman_string_helpers"

def run_hangman
  play_hangman
end

def play_hangman
  word_bank = {
    'animals' => ["bear", "kitty", "red panda"],
    'superheroes' => ["Vision", "Iron Man", "Captain America"],
    'pop_artists' => ["Ed Sheeran", "Sia", "Bruno Mars"]
  }

  clear_screen
  word = word_generator(word_bank)
  guesses_left = 5; guessed_letters = []; correct_letters = []
  
############### Start game loop ############################
  while guesses_left > 0
    padding
    hangman_guess_prompt(word, guessed_letters)
    input = gets.chomp
    valid_guess = letter_validation(input, guessed_letters)
  
    if valid_guess == false
      invalid_entry
    elsif word.include?(input.downcase) || word.include?(input.upcase)
      guessed_letters.push(input.upcase, input.downcase)
      correct_letters.push(input.upcase, input.downcase)
      
      if word_checker(word, correct_letters)
        guesses_left = 0
        victory(word)
      else 
        display_guesses_left(guesses_left)
      end

    else
      guessed_letters.push(input.upcase, input.downcase)
      guesses_left -= 1
      
      if guesses_left > 0
        display_guesses_left(guesses_left)
      else
        defeat(word)
      end

    end

    # The extra if statement is to avoid having to use hard returns on victory or defeat, allowing a player to play again.
    if !word_checker(word, correct_letters) && guesses_left > 0
      frame
      hangman_character(guesses_left)
      frame
      puts hangman_string(word, correct_letters)
      frame
    end
  end
############### End game loop ############################
  
  
  padding
  again = play_again
  again == true ? run_hangman : say_thanks
end

# Word and letter helpers **
def letter_count(word)
  word.slice!(/\s/) until !word.match(/\s/)
  word.length
end

def word_count(word)
  word.split(" ").length
end

def letter_validation(input, guessed_letters)
  return false if !input.match(/[a-zA-Z]/)
  return false if input.chars.length > 1
  return false if guessed_letters.include?(input)
  true
end

# Eliminates whitespace and duplicate letters
def chars_check_format(chars)
  chars.join.gsub(/\s/, '').chars.sort.uniq
end

def switch_case(letter)
  if letter.upcase == letter
    letter.downcase
  elsif letter.downcase == letter
    letter.upcase
  end
end

# END word and letter helpers

def word_checker(word, correct_letters)
  # Enables case insensitivity in guesses
  case_pairs = []
  word.chars.each do |char| 
    case_pairs << char && 
    case_pairs << switch_case(char)
  end

  chars_check_format(case_pairs) == correct_letters.sort
end

# Prompt Helpers **
def word_generator(word_bank)
  puts "Welcome to Hangman!"
  puts "Choose a category:"
  sleep(0.3)
  puts "1. Animals"
  puts "2. MCU Superheroes"
  puts "3. Popular music artists"
  category_input = gets.chomp
  
  case category_input
    when "1"
      word = word_bank['animals'].sample
    when "2"
      word = word_bank['superheroes'].sample
    when "3"
      word = word_bank['pop_artists'].sample
    else 
      puts "That's not an option!"
      return run_hangman
  end
  word
end

def hangman_guess_prompt(word, guessed_letters)
  if guessed_letters.length == 0
    puts "Words: #{word_count(word)}"
    puts "Letters: #{letter_count(word)}"
    puts "Make your first guess!"
  else
    puts "Guess another letter!"
  end
end

# END prompt helpers

# Draws hangman character on terminal screen
def hangman_character(guesses_left)
  case guesses_left
    when 5
      hangman_frame_1
    when 4
      hangman_frame_2
    when 3
      hangman_frame_3
    when 2
      hangman_frame_4
    when 1
      hangman_frame_5
    when 0
      hangman_frame_6
  end
end
