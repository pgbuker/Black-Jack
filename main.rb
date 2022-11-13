# frozen_string_literal: true

# require_relative 'deck'
require_relative 'game_modules'
require_relative 'round'
require_relative 'cards'
require_relative 'game'

@game = Game.new
@game.start_game
