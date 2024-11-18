require_relative 'humanplayer'
require_relative 'computerplayer'

# Class that sets up everything needed for the game to execute
class Game
  def initialize
    @player = HumanPlayer.new
    @computer = ComputerPlayer.new
  end

  def choose_gamemode
    puts 'Would you like to guess[g] the code or would you like to make[m] code and let the computer try to guess it?'
    answer = gets.chomp.downcase
    until answer =~ /^guess$|^g$|^make$|^m$/
      puts 'Please enter [guess][g] or [make][m]:'
      answer = gets.chomp.downcase
    end
    if /^guess$|^g$|^/.match?(answer)
      play_as_code_maker
    else
      play_as_code_guesser
    end
  end

  def play_as_code_maker
    
  end
end
