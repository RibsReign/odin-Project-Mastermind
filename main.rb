# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'
VALID_ROLES = %w[p m].freeze
def ask_player
  p 'Hello, welcome to Mastermind, what is your name?'
  name = gets.chomp
  p "Hello #{name}."
  loop do
    p 'Will you be playing as a player[p] or as the Mastermind[m]?'
    role = gets.chomp
    if VALID_ROLES.include?(role)
      player = Player.new(name, role)
      return player
    end
  end
end

def set_mode(player, game)
  if player.role == 'p'
    'p'
  elsif player.role == 'm'
    'm'
  end
end

game = Game.new
player = ask_player
mode = set_mode(player, game)
game.play(mode)
