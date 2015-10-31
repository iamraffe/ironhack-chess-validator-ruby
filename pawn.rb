class Pawn < Piece

	def establish_valid_moves
    @valid_moves.push  [1, 0], [-1, 0]

    # @valid_moves.push [-1, 1], [1, 1]
	end

	def valid_move?(board, origin, destination)
		add_pawn_extra_space if is_first_move?(origin)
		# add_pawn_eating_space if wants_to_eat?(board, destination)
		@current_move = [origin.first - destination.first, origin.last - destination.last]
		@valid_moves.include?(@current_move)
	end

	def add_pawn_extra_space
		@valid_moves.push([2, 0], [-2, 0])
	end

	# def wants_to_eat?(destination)
	# 	@color == 'black' && origin.first == 1 ||
	# 	@color == 'white' && origin.first == 6
	# end

	def is_first_move?(origin)
		@color == 'black' && origin.first == 1 ||
		@color == 'white' && origin.first == 6
	end

	def empty_pathway?(board, origin, destination)
		true
	end
	
end