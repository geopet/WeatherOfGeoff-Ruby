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

  def last_updated
    @parsed_json['current_observation']['observation_time']
  end

  def location
    @parsed_json['current_observation']['display_location']['full']
  end

  def current_temp
    @parsed_json['current_observation']['temp_f']
  end

  def conditions
    @parsed_json['current_observation']['weather']
  end

  def wind
    @parsed_json['current_observation']['wind_string']
  end

  def get_current
    get_json
    puts
    puts last_updated
    puts "#{location} #{@zip} - #{current_temp}F - #{conditions}"
    puts "Winds #{wind.downcase}"
  end

  def write_to_file
    File.open("#{File.dirname(__FILE__)}/archive.md", 'a') do |file|
      file.puts "#{last_updated}: #{@zip} - #{current_temp}F - #{conditions} - #{wind}"
    end
  end

end
