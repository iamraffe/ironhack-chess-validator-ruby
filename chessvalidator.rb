class ChessValidator

	def valid_move?(piece, origin, destination)
		@current_move = [origin.first - destination.first, origin.last - destination.last]
		puts "ILLEGAL" unless piece.valid_moves.include?(@current_move)
		piece.valid_moves.include?(@current_move)
	end

	def verify_move(board, piece, origin, destination)
		valid_move?(piece, origin, destination) &&
		empty_pathway?(board, origin, destination) &&
		board.empty?(destination.first, destination.last)
		# binding.pry
	end

	def horizontal_pathway(board, origin, destination)
		start_col, end_col = [origin.first, destination.first].sort
		pathway = Array(start_col..end_col).tap(&:pop).tap(&:shift)
		result = pathway.map{ |x| board.empty?(x, origin.last) }
		# binding.pry
		puts "ILLEGAL" if result.include?(false) 
		!result.include?(false) 
	end

	def vertical_pathway(board, origin, destination)
		start_row, end_row = [origin.last, destination.last].sort
		pathway = Array(start_row..end_row).tap(&:pop).tap(&:shift)
		result = pathway.map{ |y| board.empty?(origin.first, y) }
		puts "ILLEGAL" if result.include?(false)
		!result.include?(false) 
	end

	def empty_pathway?(board, origin, destination)
		@current_move.first != 0 ?
			horizontal_pathway(board, origin, destination) :
			vertical_pathway(board, origin, destination)
	end

	# def reject_move(board, destination)
	# 	at_destination = board.who_is_at(destination)
	# 	puts "There is a #{at_destination[:piece].to_s.split('').first == 'w' ? 'white' : 'black'} piece at #{destination}"
	# end	
end