require "pry"
require_relative "piece.rb"
require_relative "board.rb"
require_relative "rook.rb"
require_relative "chessvalidator.rb"
require_relative "pawn.rb"
require_relative "knight.rb"
require_relative "parser.rb"


board = Board.new
# coordinates = 'a1 a2'.split(' ');
# board.handle_move(coordinates.first, coordinates.last)

moves = File.readlines('simple_moves.txt').map{|line| line.chomp}
moves.each do |move| 
	coordinates = move.split(' ') 
	board.handle_move(coordinates.first, coordinates.last)
end