# frozen_string_literal: true

# Class that defines the way that the program checks the code for conditions and gives out hints
class GuessLogic
  def initialize
    @hints = []
    @hits = 0
  end

  def print_hits(code, guess)
    4.times do |color|
      print "'hit' " if code[color] == guess[color]
    end
  end

  def hits_amount(code, guess)
    @hits = 0
    4.times do |color|
      @hits += 1 if code[color] == guess[color]
    end
    @hits
  end

  def print_wrong_spots(code, guess)
    @hints = []
    4.times do |guess_index|
      next if code[guess_index] == guess[guess_index]

      code_color_count = code.count { |code_color| code_color == guess[guess_index] }
      @hits = color_hits_amount(code, guess, guess[guess_index])
      next unless @hits != code_color_count

      @hints << 'wrong spot'
    end
    p @hints
  end

  def color_hits_amount(code, guess, color)
    @hits = 0
    4.times do |index|
      next if code[index] != color

      @hits += 1 if code[index] == guess[index]
    end
    @hits
  end
end
