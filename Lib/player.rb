class Player
	def initialize(name)
		@name = name
		@board = Board.new(self)
	end

	attr_accessor :board
	def name
		@name
	end

	def has_ships_still_floating?
		board.rows.include?("s")
	end

	def shoot(at_coordinates, opponents_board)
		opponents_board.register_shot at_coordinates
	end
end