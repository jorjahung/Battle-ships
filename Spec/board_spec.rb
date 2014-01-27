require './Lib/board'

describe Board do
		let(:player) { double :player }
		let(:board){ Board.new player }
		empty_row = [""]*10

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

	context "Opponent's board" do

		it "Opponent's board should not show the S" do
			length, row, column = 1, 1, 1
			board.add_ship(length, row, column)
			expect(board.opponent_view).to eq([[""]*10] + [empty_row]*9)
		end

end

	context "Populating player board" do

		it 'should populate the board with a length 1 ship starting at A1' do
			length, row, column = 1, 0, 0
			board.add_ship(length, row, column)
			expect(board.rows).to eq([["s"]+[""]*9] + [empty_row]*9)
		end

		it 'should populate the board with a length 1 ship starting at A10' do
			length, row, column = 1, 0, 9
			board.add_ship(length, row, column)
			expect(board.rows).to eq([[""]*9 + ["s"]] + [empty_row]*9)
		end

		it 'should populate the board with a length 3 ship starting at A1' do
			length, row, column = 3, 0, 0
			board.add_ship(length, row, column, :right)
			expect(board.rows).to eq([["s"]*3 + [""]*7] + [empty_row]*9)
		end

		it 'should populate the board with a length 4 vertical ship at A1' do
			length, row, column = 4, 0, 0, :down
			board.add_ship(length, row, column, :down)
			expect(board.rows).to eq([["s"] + [""]*9]*4 + [empty_row]*6)
		end


	end




end