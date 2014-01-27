class Board

	COLUMNS = ("A".."J").to_a
	ROWS = (1..10).to_a
	SHIP_SIZES = [5,4,3,3,2]
	COORDS = (0..9).to_a
	ORIENTATIONS = [:right, :down]
	

	def initialize(player)
		@player = player
		@rows = Array.new(10) { Array.new(10, "") }
	end

	attr_reader :player, :rows

	def owner
		player.name
	end

	def register_shot(at_coordinates)
		number, letter = at_coordinates[1,2].to_i, at_coordinates[0].upcase
		return false unless COLUMNS.include?(letter) && ROWS.include?(number)

		row, col = ROWS.index(number), COLUMNS.index(letter)
		@rows[row][col] = !!@rows[row][col][/[xs]/] ? "x" : "o"
	end

	def opponent_view
		rows.map {|array| array.map {|x| x == "s" ? "" : x }}
	end

	def populate_board
		SHIP_SIZES.each do |length|
			ship_placed = false
			while !ship_placed
				ship_placed = add_ship(length, COORDS.sample, COORDS.sample, ORIENTATIONS.sample)
			end
		end
	end

	def add_ship(length, row, column, direction=:right)
		test_row, test_column = row, column
		maximum = (direction == :right) ? column + length : row + length
		return false if maximum > ROWS.last

		length.times do
			return false if @rows[test_row][test_column] == "s"
			(direction == :right) ? test_column += 1 : test_row += 1
		end			

		length.times do
			@rows[row][column] = "s"
			(direction == :right) ? column += 1 : row += 1
		end
	end

end
