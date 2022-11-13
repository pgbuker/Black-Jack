# frozen_string_literal: true

class Game
  include PlayGame

  START_PLAYER_BALANCE = 100
  BET = 10

  attr_reader :player_name, :player_balance, :current_round

  def initialize
    @player_name = ask_player_name
    @player_balance = START_PLAYER_BALANCE
    @empty_balance = false
  end

  def start_game
    puts "#{@player_name}, добро пожаловать в игру BlackJack!"
    loop do
      attempt = 0
      begin
        case continuance_choice
        when 'Y'
          puts "#{@player_name}, Ваш балланс: #{@player_balance}$"
          bet
          @current_round = Round.new
          balance(@current_round.round_console)
        when 'N'
          puts 'Спасибо за игру, до скорых встреч!'
          exit
        end
      rescue StandardError => e
        attempt += 1
        show_exception(e)
        retry if attempt < 3
        puts 'Обратитесь к персоналу, техническая проблема!'
      end
    end
  end

  def continuance_choice
    puts 'Xотите сыграть в игру Black Jack? (Y/N)'
    choice = gets.chomp.capitalize
    raise unless %w[N Y].include?(choice)

    choice
  end

  def bet
    if START_PLAYER_BALANCE.positive?
      @bet = BET
      @player_balance -= @bet
      puts 'Сделана ставка 10$'
    else
      puts 'Извините, но ваш баланс пуст!'
      @empty_balance = true
    end
  end

  def balance(result)
    case result
    when 'Player Win'
      @player_balance += @bet * 2
    when 'Dealer Win'
      @player_balance
    when 'Draw'
      @player_balance += @bet
    end
  end

  def show_balance
    puts @player_balance
  end
end
