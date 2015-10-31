class Parser
	COLUMNS = {
		a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7
	}
	ROWS = [0, 1, 2, 3, 4, 5, 6, 7]
	def parse_move(coordenate)
		col, row = coordenate.split('')
		row.to_i-=1
		[row,col] if COLUMNS.has_key(col.to_sym) && ROWS.has_key(row)
	end	
end