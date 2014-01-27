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

		it "Opponent's board should not show the S but show an X when hit" do
			length, row, column = 1, 0, 0
			board.add_ship(length, row, column)
			board.register_shot("A1")
			expect(board.opponent_view).to eq([["x"] + [""]*9] + [empty_row]*9)
		end

		it "Opponent's board should not show the S but show an o when in water" do
			length, row, column = 1, 0, 0
			board.add_ship(length, row, column)
			board.register_shot("B1")
			expect(board.opponent_view).to eq([[""] + ["o"] + [""]*8] + [empty_row]*9)
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

		it 'should not populate the board with a ship that goes off the board' do
			length, row, column = 4, 9, 9
			board.add_ship(length, row, column, :down)
			expect(board.rows).to eq([empty_row]*10)
		end

		it 'should add a ship if fits given the direction' do 
			length, row, column = 4, 9, 0
			board.add_ship(length, row, column, :right)
			expect(board.rows).to eq([empty_row]*9 + [["s"]*4 + [""]*6])
		end

		it 'should return true if it populates the board with a length 1 ship starting at A1' do
			length, row, column = 1, 0, 0
			expect(board.add_ship(length, row, column)).to be_true
		end

		it 'should not add a ship if it overlaps with another' do 
			length, row, column = 4, 9, 0
			board.add_ship(length, row, column, :right)
			length, row, column = 3, 7, 0
			board.add_ship(length, row, column, :down)
			expect(board.rows).to eq([empty_row]*9 + [["s"]*4 + [""]*6])
		end

		it "should return false if no ship is created" do
			length, row, column = 4, 9, 0
			board.add_ship(length, row, column, :right)
			length, row, column = 3, 7, 0
			expect(board.add_ship(length, row, column, :down)).to be_false
		end


	end




end