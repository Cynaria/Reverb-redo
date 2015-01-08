require_relative "person_controller.rb"
require 'date'
require 'pry'
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
		else
			puts "Options are combine <files>, last_name, birthdate, or gender"
		end

	end

	def combine(files)
		controller.combine_files(files)
	end

	def get_last_names
		render_people(controller.last_names)
	end

	def get_birthdate
		render_people(controller.birthdate)
	end

	def get_gender
		render_people(controller.gender)
	end

	def controller
		controller ||= PersonController.new
	end

	def render_people(people)
		people.each do |person|
			puts "Last Name: #{person.last_name} First Name: #{person.first_name} Gender: #{person.gender} Favorite Color: #{person.favorite_color} Birthdate: #{person.birthdate} "
		end
	end

	def self.render_string(string)
		puts string
	end
end

if __FILE__ == $0
	view = View.new
	view.parse_options(ARGV)
end