require 'rspec'
require_relative '../hangman'
require_relative '../games'

describe "hangman tests" do 
  let(:word) { "cat" }
  let(:word2) { "kitty" }
  let(:word3) { "Ace Bogus" }
  let(:word4) { "Iron Man" }
  let(:word5) { "Ace Bogus Jr" }
  
  let(:correct_letters) { ["t", "T", "c", "C", "a", "A"] }
  let(:correct_letters2) { ["K", "k", "t", "T", "i", "I", "y", "Y"] }
  let(:correct_letters3) { ["A", "C", "E", "B", "O", "G", "U", "S", "a", "c", "e", "b", "o", "g", "u", "s"] } 
  let(:correct_letters4) { ["I", "i", "R", "r", "O", "o", "N", "n", "M", "m", "A", "a"] }
  let(:correct_letters5) { ["A", "C", "E", "B", "O", "G", "U", "S", "a", "c", "e", "b", "o", "g", "u", "s", "J", "j", "R", "r"] }

  it "should return matched letters in words without multiples" do 
    expect(word_checker(word, correct_letters)).to eq true
  end

  it "should return matched letters in words with multiples" do 
    expect(word_checker(word2, correct_letters2)).to eq true
  end 

  it "should account for spaces" do 
    expect(word_checker(word3, correct_letters3)).to eq true
  end

  it "should account for multiples and spaces simultaneously" do
    expect(word_checker(word4, correct_letters4)).to eq true
  end

  it "should account for more than 2 words" do
    expect(word_checker(word5, correct_letters5)).to eq true
  end

end