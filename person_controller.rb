require_relative "./view.rb"
require_relative "./parser.rb"
require_relative "./person.rb"
require "date"
class PersonController
	def combine_files(files)
		if files.empty?
			View.render_string("You must specify files to combine")
		else
			Parser.combine_files(files)
		end
	end

	def last_names
		create_people.sort_by { |person| person.last_name }.reverse
	end

	def birthdate
		create_people.sort_by { |person| person.birthdate }
	end

	def gender
		create_people.sort_by { |person| [person.gender, person.last_name] }
	end

	def add_person(string)
		info = Parser.add_line(string)
		Person.new(info[0],info[1],info[2],info[3],Date.strptime(info[4], '%m/%d/%Y'))
	end

	def create_people
		combined = "./data/combined.txt"
		# Use the combined file with all records
		if File.file?(combined)
			people = []
			split = Parser.split_file(combined)
			split.each do |person|
				info = Parser.parse_info(person)
				people << Person.new(info[0],info[1],info[2],info[3],Date.strptime(info[4], '%m/%d/%Y'))
			end
			return people
		else
			View.render_string("You need to combine your files first! Use combine <files>")
		end
	end
end