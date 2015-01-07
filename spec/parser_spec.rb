require "spec_helper.rb"

describe Parser do
	describe '#split_file' do
		it 'splits file by spaces' do
			expect(Parser.split_file("./data/space.txt")).to include(" Cruz Jason Male Green 11/22/2010 ", " Liepe Evelynn Female Purple 05/11/2010 ")
		end
		it 'splits file by commas' do
			expect(Parser.split_file("./data/comma.txt")).to include( " Young, Kel, Male, Yellow, 02/27/1990 ", " Chan, Janette, Female, Purple, 05/30/1989 " )
		end
		it 'splits file by pipes' do
			expect(Parser.split_file("./data/pipe.txt")).to include(" Cruz | Elizabeth | Female | Green | 08/24/1989 ", " Brown | Ethan | Male | Blue | 04/24/1961 ")
		end
	end

	describe '#parse_info' do
		it 'splits strings by spaces' do
			expect(Parser.parse_info(" Cruz Jason Male Green 11/22/2010 ")).to eq([ "Cruz", "Jason", "Male", "Green", "11/22/2010" ])
		end
		it 'splits strings by commas' do
			expect(Parser.parse_info(" Young, Kel, Male, Yellow, 02/27/1990 ")).to eq([ "Young", "Kel", "Male", "Yellow", "02/27/1990" ])
		end
		it 'splits strings by pipes' do
			expect(Parser.parse_info(" Cruz | Elizabeth | Female | Green | 08/24/1989 ")).to eq(["Cruz", "Elizabeth", "Female", "Green", "08/24/1989"])
		end
	end
end