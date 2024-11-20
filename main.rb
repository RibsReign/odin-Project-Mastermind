# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/humanplayer'
require_relative 'lib/computerplayer'

def intro
  puts <<-INTRO
  Welcome to Mastermind!

  Mastermind is a code-breaking game for two players.

  In this version it's you against the computer - you get to choose whether to be
  code-breaker or code-maker.

  The code-breaker gets 12 attempts to guess the code set by the code-maker.

  Good luck!! You'll need it... The computer is good!

  INTRO
end

Game.new.choose_game_mode
