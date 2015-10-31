require "pry"
require_relative "piece.rb"
require_relative "board.rb"
require_relative "rook.rb"
require_relative "chessvalidator.rb"
require_relative "pawn.rb"
require_relative "knight.rb"
require_relative "parser.rb"


# board = Board.new
# 
validator = ChessValidator.new

moves = File.readlines('simple_moves.txt').map{|line| line.chomp}
moves.each do |move| 
	coordinates = move.split(' ') 
	puts validator.handle_move(coordinates.first, coordinates.last)
end