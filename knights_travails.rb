# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/knight'

# contains the board, knight, and search tree
module KnightsTravails
  class Error < StandardError; end

  def self.prompt_player
    puts 'Find the shortest path your knight can take:'
    board = Board.new
    board.knight_moves()
  end

  def self.format_input
    gets.chomp.split(//).each(&:to_i)
  end
end
