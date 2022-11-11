module Deck
  
  def generate_deck
  Card::SUITS.map { |s| Card::VALUES.map { |v| Card.new(s, v)}}
  end
  
end
