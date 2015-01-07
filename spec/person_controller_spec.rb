require "spec_helper.rb"

describe PersonController do
	let(:controller) {PersonController.new}
	describe '#combine_files' do
		it 'calls Parser#combine_files' do
			expect(Parser).to receive(:combine_files).with(["./data/space.txt", "./data/comma.txt", "./data/pipe.txt"])
			controller.combine_files("./data/space.txt", "./data/comma.txt", "./data/pipe.txt")
		end
	end
end