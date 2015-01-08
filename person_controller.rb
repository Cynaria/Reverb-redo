require_relative "./view.rb"
require_relative "./parser.rb"
require "pry"
class PersonController
	def combine_files(files)
		Parser.combine_files(files)
	end

	def create_people
		combined = "./data/combined.txt"
		# Use the combined file with all records
		if File.file?(combined)
			people = []
			split = Parser.split_file(combined)
			split.each do |person|
				info = Parser.parse_info(person)
				people << Person.new(info[0],info[1],info[2],info[3],info[4])
			end
			return people
		else
			View.render_string("You need to combine your files first! Use combine <files>")
		end
	end

end