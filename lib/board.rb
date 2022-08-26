# frozen_string_literal: true

# creates a chess board to specify piece position and boundaries
class Board
  def initialize
    @board = generate_board
  end

  def print_board
    squares = @board.map(&:join)
    squares.each_slice(8) { |row| print "#{row}\n" }
  end

  private

  attr_reader :board

  def generate_board
    board = (1..8).to_a.reverse.product(('a'..'h').to_a)
    board.each(&:reverse!)
  end
end
