# frozen_string_literal: true

COLORS = %w[red green yellow blue black orange].freeze
VALID_COLORS = %w[r g y blu bla o].freeze

# Board
class Game
  attr_reader :pattern, :info, :hint

  def initialize
    @pattern = [0, 0, 0, 0]
    @info = 'No Hits'
  end

  def play(mode)
    if mode == 'm'
      play_m
    else
      pc_pattern
      play_p
    end
  end

  def play_p
    12.times do
      return if check_guess(ask_for_guess)
    end
  end

  def play_m
    ask_for_colors
    @guess = [0, 0, 0, 0]
    puts "The code you entered is #{@pattern}"
    p 'The computer is gonna try to guess your colors now!'
    broke_out = fast
    12.times do
      broke_out = check_guess(ask_pc_for_colors)
      break if broke_out
    end
    if broke_out
      p 'The computer guessed your pattern in '
    else
      p "The computer couldn't guess your pattern in 12 turns. You win!"
    end
  end

  def count_hits(guess_array)
    hits = 0
    guess_array.each_with_index do |guess, i|
      hits += 1 if @pattern[i] == guess
    end
    hits
  end

  def count_wrong_holes(guess_array)
    pattern_colors = @pattern.tally
    guess_array.each_with_index do |guess, i|
      pattern_colors[guess] -= 1 if @pattern[i] == guess
    end

    wrong_holes = 0
    guess_array.each_with_index do |guess, i|
      next if @pattern[i] == guess

      if pattern_colors[guess].to_i > 0
        wrong_holes += 1
        pattern_colors[guess] -= 1
      end
    end
    wrong_holes
  end

  def check_guess(guess_array)
    if @pattern == guess_array
      p 'The pattern is correct!'
      return true
    end

    hits = count_hits(guess_array)
    wrong_holes = count_wrong_holes(guess_array)

    @hint = (['hit'] * hits) + (['wrong_hole'] * wrong_holes)
    p @hint
    false
  end

  def ask_for_guess
    guess_array = []
    4.times do
      color = ''
      loop do
        p "Enter a color: (#{COLORS.join(' ')})"
        color = gets.chomp
        break if COLORS.include?(color)

        p 'Invalid color. Try again.'
      end
      guess_array << color
    end
    p guess_array
    guess_array
  end

  def ask_for_colors
    4.times do |index|
      color = ''
      loop do
        p "Enter a color: (#{COLORS.join(' ')})"
        color = gets.chomp
        break if COLORS.include?(color) || VALID_COLORS.include?(color)

        p 'Invalid color. Try again.'
      end
      change_pattern(index, color)
      p @pattern
    end
  end

  def pc_pattern
    @pattern.each_index do |index|
      @pattern[index] = COLORS[rand(0..5)]
    end
    p @pattern
  end

  def change_pattern(index, color)
    color = COLORS[VALID_COLORS.index(color)] if VALID_COLORS.include?(color)
    @pattern[index] = color
  end
end

def ask_pc_for_colors
  guess_array = []
  4.times do |index|
    color = COLORS[rand(0..5)]
    guess_array[index] = color
  end
  puts "The computer guessed #{guess_array}"
  sleep(1)
  guess_array
end
