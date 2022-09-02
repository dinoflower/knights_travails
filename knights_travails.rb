# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/knight'

# contains the board, knight, and search tree
module KnightsTravails
  class Error < StandardError; end

  def self.prompt_player
    puts 'Find the shortest path your knight can take:'
    board = Board.new
    board.knight_moves(format_input, format_input)
  end

  def self.format_input
    input = []
    puts 'Please enter the row and column number of your square (enter/return after each):'
    pull_numbers { input.push(gets.chop.to_i) }
  end

  def self.pull_numbers
    yield
    yield
  end
end

KnightsTravails.prompt_player
