require 'sinatra'
set :bind, '0.0.0.0'
require 'yahoo_weatherman'

def weather_temp(location)
    client = Weatherman::Client.new
    client.lookup_by_location(location).condition['temp']
end

def weather_text(location)
    client = Weatherman::Client.new
    client.lookup_by_location(location).condition['text']
end

far_temp = (weather_temp(location) * 1.8) + 32
puts weather_text(location)
puts far_temp

