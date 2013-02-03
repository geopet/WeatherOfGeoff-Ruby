require 'test/unit'
require_relative '../lib/wogr/get_json'
require_relative 'support/vcr_setup'

class TestGetJSON < Test::Unit::TestCase

  def test_call_api
    VCR.use_cassette('standard_api_call') do
      assert_not_nil(WeatherOfGeoff::GetJSON.new(80301).call_api)
    end
  end

end



