require_relative "person_controller.rb"
class View
	def parse_options(opt)
		if opt[0] == "combine"
			combine(opt[1..-1  ])
		elsif opt[0] == "last_name"
			get_last_names
		elsif opt[0] == "birthdate"
			get_birthdate
		elsif opt[0] == "gender"
			get_gender
		end

	end

	def combine(files)
		PersonController.combine_files(files)
	end

	def get_last_names
		PersonController.last_names
	end

	def get_birthdate
		PersonController.birthdate
	end

	def get_gender
	end
end