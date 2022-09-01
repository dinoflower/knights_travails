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

  # TODO: test updated check_moves method
  def check_moves
    next_moves = VALID_MOVES.map do |move|
      temp = []
      move.each_with_index do |coord, index|
        unless (coord + @location[index]).negative? || ((coord + @location[index]) > 7)
          temp << (coord + @location[index])
        end
      end
    end
    next_moves.delete_if { |move| move.include?(nil) }
  end
end
