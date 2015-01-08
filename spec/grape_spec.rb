require "spec_helper.rb"
require 'pry'

describe 'Grapetastic' do
	include Rack::Test::Methods

	def app
		API::API
	end

	describe "POST /records" do
  	it "posts a new formatted record" do
  		post('/records/', '{"string":"Schwartz | Josh | Male | Black | 08/11/1987"}', { "CONTENT_TYPE" => "application/json" })
	    body = JSON.parse(last_response.body)
	    expect(body["first_name"]).to eq("Josh")
  	end
  end

  describe "GET /records/gender" do
    it "returns an array ordered by gender/last asc" do
      get "/records/gender"
      body = JSON.parse(last_response.body)
      expect(body[0]["first_name"]).to eq("Janette")
    end
  end

  describe "GET /records/birthdate" do
  	it "returns an array ordered by gender" do
  		get "/records/birthdate"
      body = JSON.parse(last_response.body)
      expect(body[0]["birthdate"]).to eq("04/24/1961")
  	end
  end

end