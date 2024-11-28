# frozen_string_literal: true

require_relative 'guesslogic'
# Class that defines all the behaviors that the computer controlled player can do
class ComputerPlayer
  def initialize
    @logic = GuessLogic.new
    @code = []
    @computer_guess = [nil, nil, nil, nil]
    @correct_hits = [nil, nil, nil, nil]
  end

  def computer_code_generate
    4.times do |index|
      @code[index] = COLORS[rand(0..5)]
    end
    p @code
  end

  def computer_guess_player_code(player_code)
    @computer_guess = [nil, nil, nil, nil]
    4.times do |index|
      @correct_hits[index] == player_code[index] if player_code[index] == @computer_guess[index]
    end
    4.times do |index|
      @computer_guess[index] = @correct_hits[index] unless @correct_hits[index].nil?
    end
    hints = @logic.get_wrong_spots(player_code, @computer_guess)
    attempts = hints.count
    attempts.times do |index|
      position = rand(0..3)
      if @computer_guess[position].nil?
        attempts += 1
      else
        @computer_guess[position] = hints[index]
      end
    end
    4.times do |index|
      COLORS[rand(0..5)] unless @computer_guess[index].nil?
    end

    p @computer_guess
  end
end
