# frozen_string_literal: true

require_relative 'board'

module KnightsTravails
  # creates a node at a given set of coordinates
  class Knight
    VALID_MOVES =
      [[1, 2], [-1, 2], [1, -2], [-1, -2], [2, 1], [-2, 1], [2, -1], [-2, -1]].freeze
    attr_reader :location
    attr_accessor :parent, :children

    def initialize(board, location, parent = nil)
      @board = board.board
      @location = location
      @parent = parent
      @children = []
      @board[location[0]][location[1]] = 'X'
    end

    def check_moves
      next_moves = VALID_MOVES.map do |move|
        move.filter_map.with_index do |coord, index|
          coord + @location[index] unless (coord + @location[index]).negative? || (coord + @location[index]) > 7
        end
      end
      next_moves.keep_if { |move| move.length == 2 }
    end
  end
end
