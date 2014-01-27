require './Lib/player'

describe Player do
	let(:player) {Player.new("Myname")}
	#let(:board) {Board.new(player)}

	it "is initialized with its name" do
		player = Player.new("Myname")
		expect(player.name).to eq("Myname")
	end

	it "creates a new board when initialized" do
		expect(player.board.owner).to eq(player.name)
	end

	it "should have ships still floating when created" do
		Board.any_instance.stub(:rows => Array.new(100, 's'))
		expect(player).to have_ships_still_floating
	end

	it "should not have ships still floating when all down" do
		Board.any_instance.stub(:rows => Array.new(100, 'x'))
		expect(player).not_to have_ships_still_floating
	end

	it "should call the method register_shot of the other_board" do
		other_board =  double :board
		expect(other_board).to receive(:register_shot)
		player.shoot("A1", other_board)
		
	end	

end