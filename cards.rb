class Card
  include Deck

  # SUITS =  [♠️, ❤️, ♦️, ♣️].freeze
  attr_accessor :cards

  def initialize
    @cards = Deck.generate_deck
  end


  SUITS =  ['^', '<3' , '<>', '+'].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
end
