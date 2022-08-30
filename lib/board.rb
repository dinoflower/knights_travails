# frozen_string_literal: true

require_relative 'knight'

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

  def knight_moves(start, last)
    root = build_tree(start, last)
    path = []
    trace_path(root, path, start)
    print_results(path)
  end

  private

  attr_reader :board

  def generate_board
    board = (1..8).to_a.reverse.product((1..8).to_a)
    board.each(&:reverse!)
  end

  def build_tree(start, last)
    queue = [Knight.new(start)]
    root = queue.shift
    until root.location == last
      root.check_moves.each do |move|
        root.children << temp = Knight.new(move, root)
        queue << temp
      end
      root = queue.shift
    end
    root
  end

  def trace_path(root, path, start)
    until root.location == start
      path.unshift(root.location)
      root = root.parent
    end
    path.unshift(start)
  end

  def print_results(path)
    moves = path.length - 1
    puts "You made it in #{moves} moves! Here is your path:"
    path.each { |step| print step }
  end
end
