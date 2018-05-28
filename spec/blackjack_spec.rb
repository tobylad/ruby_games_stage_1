require 'rspec'
require_relative '../blackjack'
require_relative '../games'

describe "blackjack game" do 

  it "draws a card from the deck" do
    drawn_cards = []
    drawn_cards << draw_card
    drawn_cards << draw_card

    calculate_score(drawn_cards)
  end

  it 'outputs the correct message on an instant blackjack' do 
    drawn_cards = []
    drawn_cards << { "Ace"=>11 }
    drawn_cards << { "10"=>10 }
    expect(calculate_score(drawn_cards)).to eq(21)
    expect(drawn_cards.length).to eq(2)
  end

end