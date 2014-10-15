require 'sinatra'
set :bind, '0.0.0.0'
require 'yahoo_weatherman'

def set_location(location)
    client = Weatherman::Client.new
    response = client.lookup_by_location(@post)
return response
end

def get_temperature(location)
    celsius = location.condition['temp']
    farenheit = ((9.0 / 5.0) * celsius) + 32
    farenheit = farenheit.round
return farenheit
end

def get_weather(location)
return location.condition['text']
end

get '/' do
    erb :home
end