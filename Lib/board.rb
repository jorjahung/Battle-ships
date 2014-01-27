class Board

	def initialize(player)
		@player = player
	end

	attr_reader :player

	def owner
		player.name
	end

	def register_shot at_coordinates
		if ("A".."J").to_a.include?(at_coordinates[0])
			true
		else
			false
		end
	end

	def rows
		
	end

	def opponent_view

	end

end
