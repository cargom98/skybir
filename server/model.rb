DataMapper.setup( :default, "sqlite3://#{Dir.pwd}/skybir" )
# Define the airports model

class Airportinfo
	include DataMapper::Resource

	property :id, Serial, :key => true
	property :ident, String
	property :type, String
	property :name, String
	property :latitude_deg, Float
	property :longitude_deg, Float
	property :elevation_ft, Float
	property :continet, String
	property :iso_country, String
	property :iso_region, String
	property :municipality, String
	property :scheduled_service, String
	property :gps_code, String
	property :iata_code, String
	property :local_code, String
	property :home_link, String
	property :wikipedia_link, String
	property :keywords, String
end 

DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
