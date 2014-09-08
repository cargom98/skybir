# spec/features/root_spec.rb
require_relative '../spec_helper'
 
describe 'FlightApi APP' do
    it "should respond to GET /" do
    	get '/'    
      last_response.should be_ok
    	last_response.body.should match(/root/)
  	end
  	it "should respond to GET /version" do
    	get '/version'
    	last_response.should be_ok
    	last_response.body.should match(/flightapi/)
  	end
end