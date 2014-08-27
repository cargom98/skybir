# app.rb
require 'sinatra'
require 'rest-client'
require 'json'

class FlightApi < Sinatra::Base
  get '/version' do
    "flightapi 0.1"
  end
  get '/nearbyairport' do
    "Longitude: #{params[:long]}! Latitude: #{params[:lat]}!"
    url = "http://api.geonames.org/findNearbyJSON?lat=#{params[:lat]}&lng=#{params[:long]}&fcode=AIRP&radius=20&maxRows=100&lang=iata&username=cargom98"
    response = RestClient.get(url)
  	result = JSON.parse(response.body)
  	result.to_json
  end
end
