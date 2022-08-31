# frozen_string_literal: true

require_relative 'board'

# creates a node at a given set of coordinates
class Knight
  VALID_MOVES =
    [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]].freeze
  attr_reader :location
  attr_accessor :parent, :children

  def initialize(location, parent = nil)
    @location = location
    @parent = parent
    @children = []
  end

  def check_moves
    moves = VALID_MOVES.map do |move|
      move.each_with_index do |coord, index|
        coord + @location[index] unless (coord + @location[index]).negative? || ((coord + @location[index]) > 7)
      end
    end
    moves.delete_if { |move| move.include?(nil) }
    moves
  end
end
