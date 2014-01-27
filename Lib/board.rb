class Board

	COLUMNS = ("A".."J").to_a
	ROWS = (1..10).to_a
	SHIP_SIZES = [5,4,3,3,2]
	

	def initialize(player)
		@player = player
		@rows = Array.new(10) { Array.new(10, "") }
		#populate_board
	end

	attr_reader :player

	def owner
		player.name
	end

	def register_shot at_coordinates
		row, col = at_coordinates[1,2].to_i, at_coordinates[0].upcase
		return false unless COLUMNS.include?(col) && ROWS.include?(row)

		column = COLUMNS.index(col)
		row = row-1
		@rows[row][column] == "s" ?	@rows[row][column] = "x" : @rows[row][column] = "o"

	end

	def rows
		@rows
	end

	def opponent_view
		hidden = rows.map {|array| array.map {|x| x == "s" ? "" : x }}
	end

	def populate_board
		coords = (0..9).to_a
		orientations = [:right, :down]
		SHIP_SIZES.each do |length|
			ship_placed = false
			while !ship_placed
				ship_placed = add_ship(length, coords.sample, coords.sample, orientations.sample)
			end
		end
	end
	def add_ship(length, row, column, direction=:right)
		test_row, test_column = row, column
		maximum = (direction == :right) ? column + length : row + length
		return false if maximum > 10

		length.times do
			return false if @rows[test_row][test_column] == "s"
			(direction == :right) ? test_column += 1 : test_row += 1
		end			

		length.times do
			@rows[row][column] = "s"
			(direction == :right) ? column += 1 : row += 1
		end
		true
	end



end
