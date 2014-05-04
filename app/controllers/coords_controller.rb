require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @latitude = 42.274147
    @longitude = -87.67721
    your_api_key = ""

    # Your code goes here.
    url = "https://api.forecast.io/forecast/245406459df5384e47e29fe1c7719aae/42.274147,-87.942719"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]
  end
end
