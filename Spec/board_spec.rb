require './Lib/board'

describe Board do
		let(:player) { double :player }
		let(:board){ Board.new player }

	it 'should initialize with a player' do
		expect(player).to receive(:name)
		board.owner
	end

end