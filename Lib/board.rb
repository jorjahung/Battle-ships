class Board

	COLUMNS = ("A".."J").to_a
	ROWS = (1..10).to_a
	

	def initialize(player)
		@player = player
		@rows = Array.new(10) { Array.new(10, "") }
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
		@rows
	end

	def opponent_view
		hidden = rows.map {|array| array.map {|x| x == "s" ? "" : x }}
	end

	def add_ship(length, row, column)
		@rows[row-1][column-1] = "s"
	end



end
