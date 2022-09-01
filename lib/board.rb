# frozen_string_literal: true

require 'pry-byebug'
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

  def square_passed?(location)
    @board[location[0]][location[1]].nil?
  end

  def mark_board(location)
    @board[location[0]][location[1]] = 'X' unless square_passed?(location)
  end

  def knight_moves(start, target)
    mark_board(start)
    root = build_tree(start, target)
    path = []
    trace_path(root, path, start)
    print_results(path)
  end

  private

  attr_reader :board

  def generate_board
    Array.new(8) { Array.new(8) }
  end

  def build_tree(start, target)
    queue = [Knight.new(start)]
    current = queue.shift
    binding.pry
    until current.location == target
      current.check_moves.each do |move|
        temp = Knight.new(move, current)
        current.children << temp
        queue << temp
        mark_board(move)
      end
      current = queue.shift
    end
    current
  end

  def trace_path(root, path, start)
    until root.location == start
      path << root.location
      root = root.parent
    end
    path << start
    path.reverse!
  end

  def print_results(path)
    puts "You made it in #{path.length - 1} moves! Here is your path:"
    path.each { |step| print "#{step}\n" }
  end
end

# okay, if it can cycle through the children, we can find the min path, right?
