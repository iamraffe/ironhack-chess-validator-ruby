class ChessValidator
	def initialize
		@board = Board.new
		@parser = Parser.new
	end

	def verify_move(piece, origin, destination)
		piece.valid_move?(origin, destination) &&
		piece.empty_pathway?(@board, origin, destination) &&
		piece.destination_empty?(@board, destination.first, destination.last)
	end

	def validate_move(move)
		cell = @board.who_is_at(move[:origin])
		piece = @parser.parse_piece(cell)
		verify_move(piece, move[:origin], move[:destination]) ? 'LEGAL' : 'ILLEGAL'
	end

	def handle_move(origin, destination)
		move = @parser.parse_move([origin, destination])
		@board.empty?(move[:origin].first, move[:origin].last) ? 'ILLEGAL' : validate_move(move)		
	end
end