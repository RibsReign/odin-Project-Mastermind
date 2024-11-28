# frozen_string_literal: true

require_relative 'humanplayer'
require_relative 'computerplayer'
require_relative 'guesslogic'

COLORS = %w[red green yellow blue black orange].freeze
# Class that sets up everything actions that the game needs to execute
class Game
  def initialize
    @player = HumanPlayer.new
    @computer = ComputerPlayer.new
    @logic = GuessLogic.new
  end

  def choose_game_mode
    puts 'Would you like to guess[g] the code or would you like to make[m] code and let the computer try to guess it?'
    answer = gets.chomp.downcase
    until answer =~ /^guess$|^g$|^make$|^m$/
      puts 'Please enter [guess][g] or [make][m]:'
      answer = gets.chomp.downcase
    end
    /^guess$|^g$/.match?(answer) ? play_as_code_guesser : play_as_code_maker
  end

  def play_as_code_guesser
    computer_code = @computer.computer_code_generate
    round = 0
    12.times do
      puts "You have #{12 - round} rounds left."
      round += 1
      player_guess = @player.player_code_input
      break if computer_code == player_guess

      @logic.print_hits(computer_code, player_guess)
      @logic.print_wrong_spots(computer_code, player_guess)
    end
    puts "You've Won!\nYou've guessed the code in #{round} round/s."
  end

  def play_as_code_maker
    player_code = @player.player_code_input
    @computer_guess = @computer.computer_code_generate
    round = 0
    12.times do
      break if player_code == @computer_guess || round == 12

      puts "The computer has #{12 - round} rounds left."
      round += 1
      @computer.computer_guess_player_code(player_code)
    end
    if round >= 12
      puts "The computer didn't manage to guess your code at all, good job :)"
    else
      puts "The computer has guessed your code in #{rounds} rounds."
    end
  end
end
