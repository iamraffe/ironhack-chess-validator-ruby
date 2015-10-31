class Piece
	def initialize(color)
		@color = color
		@valid_moves = []
		establish_valid_moves	
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

	def destination_empty?(board, x, y)
		board.empty?(x, y)
	end
end