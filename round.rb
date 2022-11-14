# frozen_string_literal: true

class Round
  include PlayGame

  MAX_POINTS = 21

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
    start_round
    show_cards_turn
    loop do
      pass_or_take_card
      show_cards_turn
      break if @keep_playing == false || @player_cards.count == 3 || @dealer_cards.count == 3
    end
    end_round_show_cards
    round_result
  end

  def start_round
    2.times do
      @player_cards << round_card
      @dealer_cards << round_card
    end
  end

  def show_cards_turn
    puts "Карты игрока #{@player_cards} Сумма очков: #{score(@player_cards)}"
    @player_score = score(@player_cards)
    puts "Карты дилера #{@dealer_cards.map { |_card| _card = '*' }}"
    @dealer_score = score(@dealer_cards)
  end

  def end_round_show_cards
    puts 'ИТОГ РАУНДА'
    puts "Карты игрока #{@player_cards} Сумма очков: #{score(@player_cards)}"
    puts "Карты дилера #{@dealer_cards} Сумма очков: #{score(@dealer_cards)}"
  end

  def round_result
    if @player_score > MAX_POINTS && @dealer_score > MAX_POINTS
      puts '!!!Никто не выиграл!!!'
      result = 'Draw'
    elsif (@player_score > @dealer_score && @player_score <= MAX_POINTS) || @dealer_score > MAX_POINTS
      puts '!!!ВЫ Победили!!!'
      result = 'Player Win'
    elsif (@dealer_score > @player_score && @dealer_score <= MAX_POINTS) || @player_score > MAX_POINTS
      puts '!!!Победа казино!!!'
      result = 'Dealer Win'
    else
      puts '!!!Ничья!!!'
      result = 'Draw'
    end
    result
  end
end
