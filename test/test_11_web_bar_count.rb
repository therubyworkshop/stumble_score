require File.expand_path(File.join('..', 'test_helper'), __FILE__)
require "rubygems"
require 'rack/test'
require File.expand_path(File.join('..', '..', 'lib', 'web'), __FILE__)

ENV['RACK_ENV'] = 'test'

class TestStumbleWeb < Test::Unit::TestCase
  include LocationFixtures
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_page_displays_number_of_bars_near_specified_address
    get "/?address=#{URI.escape(CHESTNUT_HILL)}"
    assert last_response.ok?, "Request failed!"
    assert last_response.body.include?("Bar count: #{CHESTNUT_HILL_BAR_COUNT}"),
      "TODO display number of bars on page for specified address."

    get "/?address=#{URI.escape(PAOLI)}"
    assert last_response.ok?, "Request failed!"
    assert last_response.body.include?("Bar count: #{PAOLI_BAR_COUNT}"),
      "That's odd. The specified number of bars works for one address but not another."

    get "/?address=#{URI.escape(RITTENHOUSE)}"
    assert last_response.ok?, "Request failed!"
    assert last_response.body.include?("Bar count: #{RITTENHOUSE_BAR_COUNT}"),
      "That's odd. The specified number of bars works in two addresses but not a third."
  end

end

