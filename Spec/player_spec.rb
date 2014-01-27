require './Lib/player'

describe Player do
	let(:player) {Player.new("Myname")}
	let(:board) {double :board}

	it "is initialized with its name" do
		player = Player.new("Myname")
		expect(player.name).to eq("Myname")
	end


end