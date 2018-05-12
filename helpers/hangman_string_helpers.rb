# Information displays
def victory(word)
  frame
  puts "#{word.chars.join(' ')}"
  frame
  puts "You won!"
end

def defeat(word)
  padding
  hangman_frame_6
  puts "You lost!  The word was:"
  frame
  puts "#{word.chars.join(' ')}"
  frame
end

def invalid_entry
  puts "Invalid entry. Try again!"
end

def display_guesses_left(guesses_left)
  puts "Guesses left: #{guesses_left}"
end

# Displays current state of word based on player guesses
def hangman_string(word, correct_letters)
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

# Hangman frames - these strings will display the hangman's progress
def hangman_frame_1
  puts <<-HEREDOC
                 _________
                 |      ||
                        ||
                        ||
                        ||
                        ||
                        ||
                        ||
                    ==========
  HEREDOC
end

def hangman_frame_2
   puts <<-HEREDOC
                 _________
                 |      ||
                 O      ||
                        ||
                        ||
                        ||
                        ||
                        ||
                    ==========
  HEREDOC
end

def hangman_frame_3
  puts <<-HEREDOC
                 _________
                 |      ||
                 O      ||
                 |      ||
                        ||
                        ||
                        ||
                        ||
                    ==========
  HEREDOC
end

def hangman_frame_4
  puts <<-HEREDOC
                 _________
                 |      ||
                 O      ||
                 |      ||
                ---     ||
                 |      ||
                        ||
                        ||
                    ==========
  HEREDOC
end

def hangman_frame_5
  puts <<-HEREDOC
                 _________
                 |      ||
                 O      ||
                 |      ||
                ---     ||
                 |      ||
                 /      ||
                /       ||
                    ==========
  HEREDOC
end

def hangman_frame_6
  puts <<-HEREDOC
                 _________
                 |      ||
                 O      ||
                 |      ||
                ---     ||
                 |      ||
                 /|     ||
                / |     ||
                    ==========
  HEREDOC
end