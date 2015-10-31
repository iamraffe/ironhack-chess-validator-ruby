class Knight < Piece

	def establish_valid_moves
    @valid_moves.push  [1, 2], [-1, 2],
    										[1,-2], [-1,-2]

	end

	def valid_move?(board, origin, destination)
		@current_move = [origin.first - destination.first, origin.last - destination.last]
		@valid_moves.include?(@current_move) || @valid_moves.include?(@current_move.reverse)
	end

	def empty_pathway?(board, origin, destination)
		true
	end
	
end