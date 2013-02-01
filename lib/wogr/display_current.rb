require_relative 'current_weather'

module WeatherOfGeoff
  module SomethingToName

    def self.display_current
      if ARGV.size == 0
        weather = CurrentWeather.new()
        puts "#{weather.get_current}"
        weather.write_to_file
      elsif
        ARGV.each do |zip| 
          weather = CurrentWeather.new(zip)
          puts "#{weather.get_current}"
        end
      end
    end

  end
end
