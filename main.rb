# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/player'
VALID_ROLES = %w[p m].freeze
VALID_COLORS = %w[r g y blu bla o].freeze
def ask_player
  p 'Hello, welcome to Mastermind, what is your name?'
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

def set_mode(player, game)
  if player.role == 'p'
    game.pc_pattern
  elsif player.role == 'm'
    ask_for_colors(game)
  end
end

def ask_for_colors(game)
  4.times do |index|
    color = ''
    loop do
      puts 'Enter a color:'
      color = gets.chomp
      break if COLORS.include?(color) || VALID_COLORS.include?(color)

      puts 'Invalid color. Try again.'
    end
    game.change_pattern(index, color)
  end
end

game = Game.new
player = ask_player
set_mode(player, game)
