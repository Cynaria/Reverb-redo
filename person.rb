class Person
	attr_accessor :last_name, :first_name, :gender, :favorite_color, :birthdate

	def initialize(last_name, first_name, gender, favorite_color, birthdate)
		@last_name = last_name
		@first_name = first_name
		@gender = gender
		@favorite_color = favorite_color
		@birthdate = birthdate
	end
end