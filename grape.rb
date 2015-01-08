require 'grape'
require_relative 'person_controller.rb'

class API < Grape::API
	format :json
	prefix :records

	helpers do
		def controller
			controller ||= PersonController.new
		end

		def hash_it(people)
			people.map do |person|
				hash_format(person)
			end
		end

		def hash_format(person)
			@person = {"last_name" => person.last_name, "first_name" => person.first_name, "gender" => person.gender, "favorite_color" => person.favorite_color, "birthdate" => person.birthdate.strftime("%m/%d/%Y")}
		end
	end

	desc "Enters new person into file"
	params do
    requires :string, type: String, desc: "person info string"
  end
	post do
		person = controller.add_person(params[:string])
		hash_format(person)
	end

	desc "Returns records sorted by gender"
	get :gender do
		people = controller.gender
		hash_it(people)
	end

	desc "Returns records sorted by birthdate asc"
	get :birthdate do
		hash_it(controller.birthdate)
	end

	desc "Returns records sorted by last name desc"
	get :last_name do
		hash_it(controller.last_names)
	end

end