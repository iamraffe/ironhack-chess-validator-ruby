
class Rook < Piece
	attr_reader :valid_moves

	def establish_valid_moves
		Array(1..7).each do |n|
     @valid_moves.push  [n,  0], [-n,  0],
                				[0,  n], [0, -n]
    end
	end

	# def attempt_move(board, origin, destination)
	# 	board.verify_move(self, origin, destination)
	# end
end