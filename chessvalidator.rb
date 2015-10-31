class ChessValidator
	def verify_move(board, piece, origin, destination)
		piece.valid_move?(board, origin, destination) &&
		piece.empty_pathway?(board, origin, destination) &&
		piece.destination_empty?(board, destination.first, destination.last)
	end
end