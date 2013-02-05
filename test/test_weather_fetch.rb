require 'test/unit'
require_relative '../config/config.rb'
require_relative '../lib/weather_of_geoff/weather_fetch'
require_relative 'support/vcr_setup'

class WeatherFetch < Test::Unit::TestCase

  def test_fetch
    VCR.use_cassette('standard_api_call') do
      assert_not_nil(WeatherOfGeoff::WeatherFetch.new(80301).fetch)
    end
  end

end



