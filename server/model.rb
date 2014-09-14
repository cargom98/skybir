DataMapper.setup( :default, "sqlite3://#{Dir.pwd}/skybir" )
# Define the airports model
class Airports
	include DataMapper::Resource
	property :airportid, Serial, :key => true
	property :name, String
	property :city, String
	property :country, String
	property :iata, String
	property :icao, String
	property :lat, Float
	property :long, Float
	property :alt, Float
	property :timezone, Float
	property :dst, String
end 
