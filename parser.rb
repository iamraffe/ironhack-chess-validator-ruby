class Parser
	COLUMNS = {
		a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7
	}
	ROWS = [0, 1, 2, 3, 4, 5, 6, 7]
	def parse_move(move)
		parsed_move = move.map do |coordinate|
			col, row = coordinate.split('')
			row = row.to_i - 1
			[row, COLUMNS[col.to_sym]] if COLUMNS.has_key?(col.to_sym) && ROWS.index(row)		
		end
		{origin: parsed_move.first, destination: parsed_move.last}
	end	
end