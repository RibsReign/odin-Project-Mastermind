class Board
  attr_reader :board, :info, :guess

  def initialize
    @board = [0, 0, 0, 0]
    @info = 'No Hits'
    @guess = ''
  end
end
