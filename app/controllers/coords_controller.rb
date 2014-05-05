require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    # @latitude = params[:latitude]
    # @longitude = params[:longitude]
    @address = params[:address]
    @url_safe_address = URI.encode(@address)

    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    your_api_key = "245406459df5384e47e29fe1c7719aae"

    # Your code goes here.
    url = "https://api.forecast.io/forecast/#{your_api_key}/#{@latitude},#{@longitude}"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]
  end
end
