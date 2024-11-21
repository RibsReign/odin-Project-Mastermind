# frozen_string_literal: true

COLORS = %w[red green yellow blue black orange].freeze
# Class that defines all the behaviors of the human player
class HumanPlayer
  def initialize
    @guess = []
  end

  def player_code_input
    4.times do
      loop do
        p "Enter a color: [#{COLORS.join(' ')}]"
        input = gets.chomp.downcase
        matches = COLORS.select { |color| color.start_with?(input) }
        if matches.length == 1
          @guess << matches.first
          break
        end
        puts 'Invalid color. Try again.'
      end
    end
    p @guess
  end

  def computer_code_guessed
  end
end

HumanPlayer.new.player_code_input
