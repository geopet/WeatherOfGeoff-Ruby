require 'net/http'
require 'json'

module WeatherOfGeoff
  class GetJSON

    attr_reader :zip

    def initialize(zip)
      @zip = zip
    end

    def call_api
      url = "http://api.wunderground.com/api/#{KEY}/conditions/q/#{zip}.json"
      resp = Net::HTTP.get_response(URI.parse(url))
      resp.body
    end

  end
end
