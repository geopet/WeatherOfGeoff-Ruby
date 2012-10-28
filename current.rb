#!/usr/bin/env rvm 1.9.3 do ruby

require 'net/http'
require 'json'
require_relative 'config'

class CurrentWeather

  def initialize(zip = "#{DEFAULT}")
    if zip.downcase == 'work'
      zip = "#{WORK}"
    elsif zip.downcase == 'home'
      zip = "#{HOME}"
    end
    @zip = zip
  end

  def get_json
    url = "http://api.wunderground.com/api/#{KEY}/conditions/q/#{@zip}.json"
    resp = Net::HTTP.get_response(URI.parse(url))
    @parsed_json = JSON.parse(resp.body)
  end

  def describe_weather
    @last_updated = @parsed_json['current_observation']['observation_time']
    @location     = @parsed_json['current_observation']['display_location']['full']
    @current_temp = @parsed_json['current_observation']['temp_f']
    @conditions   = @parsed_json['current_observation']['weather']
    @wind         = @parsed_json['current_observation']['wind_string']
  end

  def get_current
    get_json
    describe_weather
    puts
    puts "#{@last_updated}"
    puts "#{@location} #{@zip} - #{@current_temp}F - #{@conditions}"
    puts "Winds #{@wind.downcase}"
  end

end

def display_current_weather
  if ARGV.size == 0
    weather = CurrentWeather.new()
    puts "#{weather.get_current}"
  elsif
    ARGV.each do |item| 
      weather = CurrentWeather.new( item )
      puts "#{weather.get_current}"
    end
  end
end

display_current_weather
