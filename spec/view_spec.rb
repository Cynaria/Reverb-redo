require "spec_helper.rb"

describe View do
	let(:view) {View.new}
	describe '#parse_options' do
		context 'ARGV options' do
			it 'parses combine with files' do
				expect(view).to receive(:combine).with(["./data/space.txt"])
				view.parse_options(["combine", "./data/space.txt"])
			end
			it 'parses last_name' do
				expect(view).to receive(:get_last_names)
				view.parse_options(["last_name"])
			end

			it 'parses birthdate' do
				expect(view).to receive(:get_birthdate)
				view.parse_options(["birthdate"])
			end

			it 'parses gender' do
				expect(view).to receive(:get_gender)
				view.parse_options(["gender"])
			end
		end
	end

	describe '#combine' do
		it 'calls PersonController#combine_files' do
			expect(PersonController).to receive(:combine_files).with("./data/space.txt")
			view.combine("./data/space.txt")
		end
	end

	describe '#get_last_names' do
		it 'calls PersonController#last_names' do
			expect(PersonController).to receive(:last_names)
			view.get_last_names
		end
	end


end