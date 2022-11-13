class Round
  include Deck
  include PlayGame
   
  attr_reader :player_cards, :dealer_cards, :player_score, :dealer_score, :round_end

def initialize
  @player_cards = []
  @dealer_cards = []
  @player_score = 0
  @dealer_score = 0 
  @cards = generate_deck
  @keep_playing = true
end

def round_console
  init_turn
  show_cards_turn
  pass_or_take_card
    
end

# case pass_or_take_card
#   when :take_card
#   player_take_card
#   when :dealer_turn
#   dealer_take_card
# end


def init_round
  2.times do
    @player_cards << round_card
    @dealer_cards << round_card
  end
end

def show_cards_turn
  puts "Карты игрока #{@player_cards} Сумма очков: #{score(@player_cards)}"
  puts "Карты дилера #{@dealer_cards.map {|card| card = '*'}}" 
end

def end_round_show_cards
  puts "Карты игрока #{@player_cards} Сумма очков: #{score(@player_cards)}"
  puts "Карты дилера #{@dealer_cards} Сумма очков: #{score(@dealer_cards)}" 
end

end
