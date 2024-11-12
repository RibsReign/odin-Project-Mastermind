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

  def make_board
    @pattern.each_index do |index|
      @pattern[index] = COLORS[rand(0..5)]
    end
    p @pattern
  end
end
