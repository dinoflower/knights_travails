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
    make_tree(start, last)
    history = []
  end

  def build_tree(start, last)
    root = Knight.new(start)
    until root.location == last
      root.next_moves.each do |move|
        root.children << Knight.new(root, move)
      end
      # wait I need to move through the parent nodes oops
    end
  end
end
