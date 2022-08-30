# frozen_string_literal: true

require_relative 'board'

# creates a node at a given set of coordinates
class Knight
  VALID_MOVES =
    [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]].freeze
  attr_reader :location

  def initialize(location = nil)
    @location = location
    @parent = nil
  end
end

# up to 8 possible children... do they need to be named variables?
# NO each child only needs ONE PARENT work BACKWARDS
