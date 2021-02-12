require 'TDD_Project.rb'

describe Array do 
    describe "#my_uniq" do 
    let(:tester) {[1, 1, 2, 3]}
        it "removes duplicates" do
        
            expect(tester.my_uniq).to eq([1, 2, 3])
         
        end 
    end
end

describe Array do 
    describe '#two_sum' do 
        it "returns an array of index pairs that sum to 0" do
            array = [1,2,-1,3,-2] 
            expect(array.two_sum).to eq([[0, 2], [1, 4]])
        end
    end

end

describe "#my_transpose" do
    context "with valid arguments" do 
        
    
        it "transposes an array" do
            array = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
          ]
            expect(my_transpose(array)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
        end
    end
    context "with invalid arguments" do
        it "raises an error if argument is not an array" do
            expect {my_transpose('hi')}.to raise_error("invalid argument; cant be string")
            expect {my_transpose(8)}.to raise_error("invalid argument; cant be number")

        end
    end
end

describe "#stockpicker" do
    it "returns pair with greatest profit" do
        expect(stockpicker([1, 3, 2, 5])).to eq([0, 3])
    end

end

describe Hanoi do 
    describe "#initialize" do 
        it "initializes the game correctly" do
            game = Hanoi.new
            expect(game.pile).to eq([[3,2,1],[],[]])
        end
    end

    describe "#move" do
        it "raises an error if disc being moved is bigger than the disc already in the pile" do
        game.pile = [[3,2],[1],[]] 
        expect{game.move(0,1)}.to raise_error("cant move it there")
        end
        it "raises an error if disc is being moved to a pile that does not exist" do
    end
    end
end