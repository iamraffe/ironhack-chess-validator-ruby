

class Pawn < Piece

	def establish_valid_moves
		Array(1..7).each do |n|
     @valid_moves.push  [n,  0], [-n,  0],
                				[0,  n], [0, -n]
    end
	end
	
end