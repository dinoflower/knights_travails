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

  def mark_board(location)
    x = location[0]
    y = location[1]
    @board[x][y] = 'X' if @board[x][y].nil?
  end

  def knight_moves(start, target)
    root = build_tree(start, target)
    path = []
    trace_path(root, path, target)
    print_results(path)
  end

  private

  attr_reader :board

  def generate_board
    Array.new(8) { Array.new(8) }
  end

  def build_tree(start, target)
    queue = [Knight.new(start)]
    until queue.empty?
      current = queue.shift
      return current if current.location == target

      current.check_moves.each do |move|
        current.children << temp = Knight.new(move, current)
        queue << temp
      end
    end
  end

  def trace_path(root, path, start)
    until root.location == start
      path.unshift(root.location)
      root = root.parent
    end
    path.unshift(start)
  end

  def print_results(path)
    puts "You made it in #{path.length - 1} moves! Here is your path:"
    path.each { |step| print step }
  end
end

# okay, if it can cycle through the children, we can find the min path, right?
