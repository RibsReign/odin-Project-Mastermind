require_relative 'humanplayer'
require_relative 'computerplayer'

# Class that sets up everything needed for the game to execute
class Game
  def initialize
    @player = HumanPlayer.new
    @computer = ComputerPlayer.new
  end

  def choose_game_mode
    puts 'Would you like to guess[g] the code or would you like to make[m] code and let the computer try to guess it?'
    answer = gets.chomp.downcase
    until answer =~ /^guess$|^g$|^make$|^m$/
      puts 'Please enter [guess][g] or [make][m]:'
      answer = gets.chomp.downcase
    end
    /^guess$|^g$/.match?(answer) ? play_as_code_maker : play_as_code_guesser
  end

  def play_as_code_maker
    player_code = @player.player_code_input
    round = 0
    12.times do
      break if @computer.player_code_guessed || round == 12

      puts "The computer has #{12 - rounds} rounds left."
      round += 1
      @computer.computer_guess_player_code(player_code)
    end
    if round >= 12
      puts "The computer didn't manage to guess your code at all, good job :)"
    else
      puts "The computer has guessed your code in #{rounds} rounds."
    end
  end

  def play_as_code_guesser
    computer_code = @computer.computer_code_generate
    round = 0
    12.times do
      puts "You have #{12 - round} rounds left."
      round += 1
      player_guess = @player.player_code_input
      break if @player.computer_code_guessed(computer_code, player_guess)
    end
    puts "You have guessed the code in #{rounds} rounds."
  end
end
