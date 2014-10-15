require 'sinatra'
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

    client = Weatherman::Client.new
    get '/' do
    @current_page = ''
    erb :home
end

    post '/weather' do
    @post = params[:post]["location"]
    location = set_location(@post)
    @temp = get_temperature(location)
    @weather = get_weather(location)

    if (@weather.downcase.include?('sunny'))
@current_page = 'sunny'
erb :sunny

    elsif (@weather.downcase.include?('rain'))
@current_page = 'rainy'
erb :rainy

    elsif (@weather.downcase.include?('cloudy'))
@current_page = 'cloudy'
erb :cloudy

    else
@current_page = ''
erb :default

    end
end