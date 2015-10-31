class Rook
	attr_reader :valid_moves
	def initialize
		@valid_moves = []
		establish_valid_moves
	end

	def establish_valid_moves
		Array(1..7).each do |n|
     @valid_moves.push  [n,  0], [-n,  0],
                				[0,  n], [0, -n]
    end
	end

	def attempt_move(board, origin, destination)
		board.verify_move(self, origin, destination)
	end

	# def valid_move?(origin, destination)
	# 	move = [origin.first - destination.first, origin.last - destination.last]
	# 	@valid_moves.include?(move)
	# end

	# def verify_move(board, origin, destination)
	# 	valid_move?(origin, destination)
	# 	empty_pathway?(board, origin, destination)
	# 	board.empty?(destination.first, destination.last) ? handle_move(board, origin, destination) : reject_move(board, destination)
	# end

	# def horizontal_pathway(board, origin, destination)
	# 	start_col, end_col = [origin.first, destination.first].sort
	# 	pathway = Array(start_col..end_col).tap(&:pop).tap(&:shift)
	# 	result = pathway.each{ |x| puts board.empty?(x, origin.last) }
	# 	result.any?(true) ? false : true
	# end

	# def vertical_pathway(board, origin, destination)
	# 	start_row, end_row = [origin.last, destination.last].sort
	# 	pathway = Array(start_row..end_row).tap(&:pop).tap(&:shift)
	# 	result = pathway.each{ |y| puts board.empty?(origin.first, y) }
	# 	result.any?(true) ? false : true
	# end

	# def empty_pathway?(board, origin, destination)
	# 	horizontal_pathway(board, origin, destination)
	# 	vertical_pathway(board, origin, destination)
	# end

	# def reject_move(board, destination)
	# 	at_destination = board.who_is_at(destination)
	# 	puts "There is a #{at_destination[:piece].to_s.split('').first == 'w' ? 'white' : 'black'} piece at #{destination}"
	# end
end