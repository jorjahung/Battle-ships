class Player
	def initialize(name)
		@name = name
		@board = Board.new(self)
		@board.populate_board
	end

	attr_reader :board, :name

	def has_ships_still_floating?
		board.rows.flatten.include?("s")
	end

	def shoot(at_coordinates, opponents_board)
		opponents_board.register_shot at_coordinates
	end
end