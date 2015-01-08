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
	    p body
	    expect(body["first_name"]).to eq("Josh")
  	end
  end
end