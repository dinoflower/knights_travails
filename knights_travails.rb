# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/knight'

# contains the board, knight, and search tree
module KnightsTravails
  class Error < StandardError; end

  def knight_moves(square_a, square_b)
    Knight.new(square_a)
  end
end
