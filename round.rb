class Round
  include Deck
  include PlayGame
   
  attr_reader :player_cards, :dealer_cards, :player_score, :dealer_score, :cards

def initialize
  @player_cards = []
  @dealer_cards = []
  @player_score = 0
  @dealer_score = 0 
  @cards = generate_deck
end




def init_turn
2.times do
  @player_cards << round_card
  @dealer_cards << round_card
end
end

end
