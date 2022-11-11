module Deck
  
  def generate_deck
    Card::SUITS.map { |s| Card::VALUES.map { |v| v.to_s + s}}.flatten
  end

end


