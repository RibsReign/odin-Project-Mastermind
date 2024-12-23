# frozen_string_literal: true

# Class that defines all the behaviors of the human player
class HumanPlayer
  def initialize
    @player_code = []
  end

  def player_code_input
    4.times do |index|
      loop do
        puts "\nEnter a color: [#{COLORS.join(' ')}]"
        input = gets.chomp.downcase
        matches = COLORS.select { |color| color.start_with?(input) }
        if matches.length == 1
          p @player_code[index] = matches.first
          break
        end
        puts 'Invalid color. Try again.'
      end
    end
    puts "\nThis is your code:#{@player_code}"
    @player_code
  end

  # def give_hints(computer_code, player_guess)
  #   print_hits(computer_code, player_guess)
  #   print_wrong_positions(computer_code, player_guess)
  # end
end

# HumanPlayer.new.player_code_input
