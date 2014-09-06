# app.rb
require 'sinatra'
require 'rest-client'
require 'json'
require 'twilio-ruby'

class FlightApi < Sinatra::Base
  
  def sendcode(number,code)
    # put your own credentials here 
    account_sid = 'AC66e5bf0268a022039ae5e46db4b30356' 
    auth_token = '07573bd8292ae07dd1f7e186c3e86b32' 
 
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 
 
    @client.account.messages.create({
      :from => '+15615315542', 
      :to => "#{number}", 
      :body => "Please enter the following code #{code}",  
    })
  end

  get '/version' do
    "flightapi 0.1"
  end
  
  get '/nearbyairport' do
    appid = "816afdf3"
    appkey = "5131ea27d6454d7d0cc72c133ee954c2"
    long = "17"
    lat ="39"
    url = "https://api.flightstats.com/flex/airports/rest/v1/json/withinRadius/#{long}/#{lat}/30?appId=#{appid}&appKey=#{appkey}"
    response = RestClient.get(url)
  	result = JSON.parse(response.body)
  	result.to_json
  end
  
  get '/registration' do
    phone = "#{params[:number]}"
    code = Random.new.rand(1000..9999)
    sendcode("#{phone}","#{code}")   
  end
end
