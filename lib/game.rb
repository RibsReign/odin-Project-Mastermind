# frozen_string_literal: true

COLORS = %w[red green yellow blue black orange].freeze
# Board
class Game
  attr_reader :pattern, :info, :guess

  def initialize
    @pattern = [0, 0, 0, 0]
    @info = 'No Hits'
    @guess = ''
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
    p @pattern
  end
end
