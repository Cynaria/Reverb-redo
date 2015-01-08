require "spec_helper.rb"

describe View do
	let(:view) {View.new}
	# let(:controller) {PersonController.new}
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
			expect_any_instance_of(PersonController).to receive(:combine_files).with(["./data/space.txt", "./data/comma.txt", "./data/pipe.txt"])
			view.combine(["./data/space.txt", "./data/comma.txt", "./data/pipe.txt"])
		end
	end

	describe '#get_last_names' do
		it 'calls PersonController#last_names' do
			expect_any_instance_of(View).to receive(:render_people)
			view.get_last_names
		end
	end

	describe '#get_birthdate' do
		it 'calls PersonController#birthdate' do
			expect_any_instance_of(View).to receive(:render_people)
			view.get_birthdate
		end
	end

	describe '#get_gender' do
		it 'calls PersonController#gender' do
			expect_any_instance_of(View).to receive(:render_people)
			view.get_gender
		end
	end

	describe '#render_people' do
		let(:people) {[Person.new("Liepe", "Tammy", "Female", "Pink", "04/24/1961"), Person.new("Liepe", "Michael", "Male", "Red", "07/27/1960")]}
		it 'renders Person objects to stdout' do
			expect {view.render_people(people)}.to output("Last Name: Liepe First Name: Tammy Gender: Female Favorite Color: Pink Birthdate: 04/24/1961 \nLast Name: Liepe First Name: Michael Gender: Male Favorite Color: Red Birthdate: 07/27/1960 \n").to_stdout

		end
	end

	describe '#render_string' do
		let(:string) {"I'm a string being rendered! Yaaaay..."}
		it 'renders strings to output' do
			expect {View.render_string(string)}.to output("I'm a string being rendered! Yaaaay...\n").to_stdout
		end
	end
end