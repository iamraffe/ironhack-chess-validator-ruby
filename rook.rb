
class Rook < Piece
	attr_reader :valid_moves

	def establish_valid_moves
		Array(1..7).each do |n|
     @valid_moves.push  [n,  0], [-n,  0],
                				[0,  n], [0, -n]
    end
	end

	def valid_move?(origin, destination)
		@current_move = [origin.first - destination.first, origin.last - destination.last]
		@valid_moves.include?(@current_move)
	end

	# def valid_move?(board, piece, origin, destination)
	# 	valid_move?(piece, origin, destination) &&
	# 	empty_pathway?(board, origin, destination) &&
	# 	destination_empty?(destination.first, destination.last)
	# end

	def empty_pathway?(board, origin, destination)
		@current_move.first != 0 ?
			horizontal_pathway(board, origin, destination) :
			vertical_pathway(board, origin, destination)
	end



end