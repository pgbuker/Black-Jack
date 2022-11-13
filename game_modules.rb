# frozen_string_literal: true

module PlayGame
  def generate_deck
    Card::SUITS.map { |s| Card::VALUES.map { |v| v.to_s + s } }.flatten
  end

  def ask_player_name
    puts 'Введите своё имя для игры: '
    gets.chomp.capitalize
  end

  def pass_or_take_card
    puts '1 - Взять карту'
    puts '5 - Вскрыть карты'
    puts '0 - Пропустить ход'
    case gets.to_i
    when 1
      player_take_card
      dealer_decision
    when 0
      dealer_decision
    when 5
      @keep_playing = false
    end
  end

  def dealer_decision
    if @dealer_score < 17
      dealer_take_card
    else
      puts 'Дилер пропускает ход'
    end
  end

  def player_take_card
    @player_cards << round_card if @player_cards.count <= 2
  end

  def dealer_take_card
    @dealer_cards << round_card if @dealer_cards.count <= 2
  end

  def round_card
    @cards.delete(@cards.sample)
  end

  def score(cards)
    score = cards.map(&:to_i).sum
    score += cards.select { |c| %w[J Q K].include? c[0] }.count * 10
    ace_in_hand = cards.select { |c| ['A'].include? c[0] }.count
    ace_in_hand.times do
      score += if score <= 10
                 11
               else
                 1
               end
    end
    score
  end

  def show_exception(exception)
    puts 'Неправильно введены данные!'
    puts " #{exception.message} "
  end
end
