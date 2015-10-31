class Parser
	COLUMNS = {
		a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7
	}
	ROWS = [0, 1, 2, 3, 4, 5, 6, 7]
	COLORS = {
		b: 'black',
		w: 'white'
	}
	PIECES = {
		r: Rook,
		p: Pawn,
		n: Knight,
	}
	def parse_move(move)
		parsed_move = move.map do |coordinate|
			col, row = coordinate.split('')
			row = row.to_i - 1
			[row, COLUMNS[col.to_sym]] if COLUMNS.has_key?(col.to_sym) && ROWS.index(row)		
		end
		{origin: parsed_move.first, destination: parsed_move.last}
	end	

	def parse_piece(piece)
		color_symbol = COLORS[piece[:piece].to_s.split('').first.to_sym]
		piece_symbol = PIECES[piece[:piece].to_s.split('').last.downcase.to_sym]
		piece_symbol.new(color_symbol)
	end
end