require_relative 'get_json'

module WeatherOfGeoff
  class CurrentWeather

    attr_reader :zip, :json

    def initialize(zip = "#{DEFAULT}")
      if zip.downcase == 'work'
        zip = "#{WORK}"
      elsif zip.downcase == 'home'
        zip = "#{HOME}"
      end
      @zip = zip
      @json = GetJSON.new(@zip).call_api
    end

    def parsed_json
      JSON.parse(json)
    end

    def last_updated
      parsed_json['current_observation']['observation_time']
    end

    def location
      parsed_json['current_observation']['display_location']['full']
    end

    def current_temp
      parsed_json['current_observation']['temp_f']
    end

    def conditions
      parsed_json['current_observation']['weather']
    end

    def wind
      parsed_json['current_observation']['wind_string']
    end

    def get_current
      puts
      puts last_updated
      puts "#{location} #{zip} - #{current_temp}F - #{conditions}"
      puts "Winds #{wind.downcase}"
    end

    def write_to_file
      File.open("#{File.dirname(__FILE__)}/archive.md", 'a') do |file|
        file.puts "#{last_updated}: #{zip} - #{current_temp}F - #{conditions} - #{wind}"
      end
    end

  end
end
