class Board
	def initialize()
		default_board
		@validator = ChessValidator.new
		@parser = Parser.new
	end
	
	def default_board
		@board = Array.new(8).map { |row| row = Array.new(8) }
		set_startup_pieces
	end

	def set_startup_pieces
		default_board_state = IO.read('simple_board.txt');
		translate_state(default_board_state)
	end

	def translate_state(board_state)
    board_state.split("\n").each_with_index do |row, row_number|
      row.split.each_with_index do |cell, column_number|
      	@board[row_number][column_number] = {piece: cell.to_sym, coordinates: [column_number, row_number]} if has_piece?(cell)
      end
    end
	end

	def has_piece?(cell)
		cell != '--'
	end

	def empty?(x,y)
		@board[x][y].nil? ? true : false
		# binding.pry
	end

	def who_is_at(coordinates)
		@board[coordinates.first][coordinates.last]
	end

	def verify_move(piece, origin, destination)
		move = @parser.parse_move([origin, destination])
		# binding.pry
		puts "LEGAL" if @validator.verify_move(self, piece, move[:origin], move[:destination])
		# binding.pry
	end
end