# frozen_string_literal: true

# creates a chess board to specify piece position and boundaries
class Board
  def initialize
    @board = generate_board
  end

  def board_array
    @board.map
  end

  # prints a reference board with chess positions
  def print_board
    squares = @board.map(&:join)
    squares.each_slice(8) { |row| print "#{row}\n" }
  end

  private

  attr_reader :board

  def generate_board
    board = (1..8).to_a.reverse.product((1..8).to_a)
    board.each(&:reverse!)
  end

  def knight_moves(start, last)
    location = make_tree(start, last)
    history = []
  end

  def make_tree(start, last); end
end

# creates a node at a given set of coordinates
class Knight
  VALID_MOVES =
    [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]].freeze
  attr_reader :location

  def initialize(board, location = nil)
    @board = board
    @location = location
  end
end
