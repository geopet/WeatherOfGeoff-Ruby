module WeatherOfGeoff
  class ConfigParser

    require_relative '../../config/config.rb'

    def key
      KEY
    end

    def default
      DEFAULT
    end

    def work
      WORK
    end

    def home
      HOME
    end

    if __FILE__ == $0
      config = ConfigParser.new
      puts config.key
      puts config.default
      puts config.work
      puts config.home
    end

  end
end
