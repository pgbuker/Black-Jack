module PlayGame

  def ask_player_name
    puts "Введите своё имя для игры: "
    gets.chomp.capitalize
  end

  def welcome
    puts "Добро пожаловать, хотите сыграть в игру Black Jack? (Y/N)"
    gets.chomp.capitalize
  end

  def pass_or_take_card
    puts "1 - Взять карту"
    puts "0 - Пропустить ход"
    decision = gets.to_i
    return :take_card  if decision == 1
    :dealer_turn
  end

  def player_take_card
    @player_cards << round_card
  end

  def dealer_take_card
    @dealer_cards << round_card
  end

  def round_card
    @cards.delete(@cards.sample)
  end


  def score(cards)
    amount = cards.map(&:to_i).sum
    amount += cards.select {|c| ['J', 'Q', 'K'].include? c[0]}.count * 10 
  end

  def picture?(cards)
  @value = 10 if cards.select {|c| ['J', 'Q', 'K'].include?}
  end
  


end
