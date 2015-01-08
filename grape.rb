require 'grape'
require_relative 'person_controller.rb'
require 'pry'

class API < Grape::API
	format :json
	prefix :records

	helpers do
		def controller
			controller ||= PersonController.new
		end
	end

	desc "Enters new person into database"
	params do
    requires :string, type: String, desc: "person info string"
  end
	post do
		person = controller.add_person(params[:string])
		@person = {"last_name" => person.last_name, "first_name" => person.first_name, "gender" => person.gender, "favorite_color" => person.favorite_color, "birthdate" => person.birthdate.strftime("%m/%d/%Y")}
	end

end