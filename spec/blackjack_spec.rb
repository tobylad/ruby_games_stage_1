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

end