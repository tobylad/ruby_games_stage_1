# Future improvements
  # Logic for case, do what you can for typos
  # More libs!

def run_mad_libs
  clear_screen
  puts "Welcome to Mad Libs! Choose a story!"
  puts "1. Be kind"
  puts "2. Lucy in the Sky with Diamonds"
  story = gets.chomp
  play_mad_libs(story)
end

def play_mad_libs(story)
  case story
    when "1"
      input = story_1_input
      display = display_story1(input)
    when "2"
      input = story_2_input
      display = display_story2(input)
    else
      puts "That's not one of the stories! Try again!"
      run_mad_libs
  end
  
  display
  
  again = play_again
  again == true ? run_mad_libs : say_thanks
end

def story_1_input
  words = []
  
  puts "Adjective."
  adjective1 = gets.chomp
  words << adjective1
  
  puts "Noun."
  noun1 = gets.chomp
  words << noun1
  
  words
end

def display_story1(libs)
  padding
  puts "YOUR COMPLETED MAD LIBS:"
  
  frame
  puts "Be kind to your #{libs[0]} #{libs[1]}!"
  frame
  padding
end

def story_2_input
  words = []
  
  puts "Verb."
  verb1 = gets.chomp
  words << verb1
  
  puts "Noun."
  noun1 = gets.chomp
  words << noun1
  
  puts "Food."
  food1 = gets.chomp
  words << food1
  
  puts "Another food."
  food2 = gets.chomp
  words << food2
  
  puts "Singular pronoun."
  pronoun1 = gets.chomp
  words << pronoun1
  
  puts "Verb."
  verb2 = gets.chomp
  words << verb2
  
  puts "Adverb."
  adverb1 = gets.chomp
  words << adverb1
  
  puts "Adjective."
  adjective1 = gets.chomp
  words << adjective1
  
  words
end

def display_story2(libs)
  padding
  puts "YOUR COMPLETED MAD LIBS:"
  
  frame
  puts "#{libs[0].capitalize} yourself in a #{libs[1]} on a river, with #{libs[2]} trees and #{libs[3]} skies. #{libs[4].capitalize} calls you; you #{libs[5]} quite #{libs[6]}, a girl with #{libs[7]} eyes."
  frame
  padding
end