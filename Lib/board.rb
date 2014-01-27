class Board

	COLUMNS = ("A".."J").to_a
	ROWS = (1..10).to_a

	def initialize(player)
		@player = player
	end

	attr_reader :player

	def owner
		player.name
	end

	def register_shot at_coordinates
		row, col = at_coordinates[1,2].to_i, at_coordinates[0].upcase
		return false unless COLUMNS.include?(col) && ROWS.include?(row)
		true
		
	end

	def rows
		
	end

	def opponent_view

	end

end
