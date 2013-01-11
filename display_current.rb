require_relative 'current_weather'

def display_current
  if ARGV.size == 0
    weather = Current_Weather.new()
    puts "#{weather.get_current}"
  elsif
    ARGV.each do |item| 
      weather = Current_Weather.new( item )
      puts "#{weather.get_current}"
    end
  end
end
