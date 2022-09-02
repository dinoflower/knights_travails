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
    puts 'Would you like to go again?'
    answer = $stdin.gets.chr.upcase
    answer == 'Y' ? prompt_player : exit
  end

  def self.format_input
    input = []
    puts 'Please provide the row number:'
    input.push(gets.chop.to_i)
    puts 'Please provide the column number:'
    input.push(gets.chop.to_i)
  end
end

KnightsTravails.prompt_player
