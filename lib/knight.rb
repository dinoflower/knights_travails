# frozen_string_literal: true

require 'pry-byebug'
require_relative 'board'

# creates a node at a given set of coordinates
class Knight
  VALID_MOVES =
    [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]].freeze
  attr_reader :location
  attr_accessor :parent, :children

  def initialize(board, location, parent = nil)
    @board = board
    @location = location
    @parent = parent
    @children = []
  end

  def square_passed?(location)
    @board[location[0]][location[1]].nil?
  end

  def mark_board(location)
    @board[location[0]][location[1]] = 'X' unless square_passed?(location)
  end

  def check_moves
    next_moves = VALID_MOVES.map do |move|
      move.filter_map.with_index do |coord, index|
        coord + @location[index] if (coord + @location[index]).positive? && (coord + @location[index]) < 8
      end
    end
    binding.pry
    next_moves.delete_if { |move| move.length < 2 }
  end
end

# (coord + @location[index]).negative? || ((coord + @location[index]) > 7)
