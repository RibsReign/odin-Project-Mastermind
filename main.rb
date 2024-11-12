# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'
VALID_ROLES = %w[p m].freeze

def ask_player
  p 'Hello welcome to Mastermind, what is your name?'
  name = gets.chomp
  loop do
    p 'Will you be playing as a player[p] or as the Mastermind[m]?'
    role = gets.chomp
    if VALID_ROLES.include?(role)
      player = Player.new(name, role)
      return player
    end
  end
end

player = ask_player
p player.name
game = Game.new
game.make_board
