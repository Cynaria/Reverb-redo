require_relative "./parser.rb"
class PersonController
	def combine_files(*files)
		Parser.combine_files(files)
	end
end