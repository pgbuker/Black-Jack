class Card
   include Deck
   include PlayGame

  SUITS =  %w[♠️ ❤️ ♦️ ♣️].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze

end

