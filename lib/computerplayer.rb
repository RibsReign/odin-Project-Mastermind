# frozen_string_literal: true

COLORS = %w[red green yellow blue black orange].freeze
# Class that defines all the behaviors that the computer controlled player can do
class ComputerPlayer
  def initialize
    @code = []
  end

  def computer_code_generate
    4.times do |index|
      @code[index] = COLORS[rand(0..5)]
    end
    p @code
  end

  def player_code_guessed
  end

  def computer_guess_player_code
  end
end
ComputerPlayer.new.computer_code_generate
