require_relative 'current_weather'

def display_current
  if ARGV.size == 0
    weather = CurrentWeather.new()
    puts "#{weather.get_current}"
    weather.write_to_file
  elsif
    ARGV.each do |item| 
      weather = CurrentWeather.new( item )
      puts "#{weather.get_current}"
    end
  end
end
