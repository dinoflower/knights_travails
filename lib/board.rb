# frozen_string_literal: true

require 'pry-byebug'
require_relative 'knight'

# creates a chess board to specify piece position and boundaries
class Board
  attr_reader :board

  def initialize
    @board = generate_board
    print_board
  end

  def print_board
    print "    0 1 2 3 4 5 6 7\n"
    print "    _ _ _ _ _ _ _ _\n"
    @board.each_with_index do |row, i|
      print "#{i}: |", row.map { |square| square.nil? ? '_' : 'X' }.join('|'), "|\n"
    end
  end

  def knight_moves(start, target)
    @board.each { |row| row.fill(nil) }
    root = build_tree(start, target)
    path = []
    trace_path(root, path, start)
    print_results(path)
  end

  private

  def generate_board
    Array.new(8) { Array.new(8) }
  end

  def build_tree(start, target)
    queue = [Knight.new(self, start)]
    current = queue.shift
    until current.location == target
      binding.pry
      current.check_moves.each do |move|
        next unless square_unpassed?(move)

        temp = Knight.new(self, move, current)
        current.children << temp
        queue << temp
      end
      current = queue.shift
    end
    current
  end

  def square_unpassed?(location)
    @board[location[0]][location[1]].nil?
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
    if path.length - 1 == 1
      puts 'You made it in 1 move! Here is your path:'
    else
      puts "You made it in #{path.length - 1} moves! Here is your path:"
    end
    path.each { |step| print "#{step}\n" }
  end
end
