class Game
  include PlayGame

  START_PLAYER_BALANCE = 100
  ROUND_RATE = 10

  attr_reader :player_name, :player_balance

  def initialize
    @player_name = ask_player_name
    @player_balance = START_PLAYER_BALANCE

  end

  def method_name
    
  end
end
