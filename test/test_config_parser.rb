require 'test/unit'
require_relative '../lib/wogr/config_parser'

class TestConfigParser < Test::Unit::TestCase

  def test_key
    assert_not_nil(WeatherOfGeoff::ConfigParser.new.key)
  end

  def test_default
    assert_not_nil(WeatherOfGeoff::ConfigParser.new.default)
  end

end
