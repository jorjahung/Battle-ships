require './Lib/board'

describe Board do
		let(:player) { double :player }
		let(:board){ Board.new player }

	it 'should initialize with a player' do
		expect(player).to receive(:name)
		board.owner
	end

	it 'should return nil if shot is not valid' do
		expect(board.register_shot("Z1")).to be_false
	end

	it 'should return true if shot is  valid' do
		expect(board.register_shot("A1")).to be_true
	end

	it 'should return false if shot is not valid' do
		expect(board.register_shot("A15")).to be_false
	end

	it 'should return true if shot is valid (include lowercase)' do
		expect(board.register_shot("c9")).to be_true
	end

end