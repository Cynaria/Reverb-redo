require "spec_helper.rb"

describe PersonController do
	let(:controller) {PersonController.new}
	describe '#combine_files' do
		it 'calls Parser#combine_files' do
			expect(Parser).to receive(:combine_files).with(["./data/space.txt", "./data/comma.txt", "./data/pipe.txt"])
			controller.combine_files(["./data/space.txt", "./data/comma.txt", "./data/pipe.txt"])
		end
	end

	describe '#create_people' do
		context 'when combined.txt is present' do
			# xit out when combined is not present
			it 'creates an array of people' do
				expect(controller.create_people[0].first_name).to eq("Evelynn")
			end
		end
		context 'when combined.txt is not present' do
			# xit out when combined.txt is present
			xit 'calls render_string' do
				expect(View).to receive(:render_string).with ("You need to combine your files first! Use combine <files>")
				controller.create_people
			end
		end

	end
end