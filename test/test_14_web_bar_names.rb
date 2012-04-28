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

  def test_page_displays_bar_names_near_specified_address
    get "/?address=#{URI.escape(CHESTNUT_HILL)}"
    assert last_response.ok?, "Request failed!"
    assert last_response.body.include?(CHESTNUT_HILL_BAR),
      "TODO display bars on page near specified address."

    get "/?address=#{URI.escape(PAOLI)}"
    assert last_response.ok?, "Request failed!"
    assert last_response.body.include?(PAOLI_BAR),
      "That's odd. The bar list works for one address but not another."

    get "/?address=#{URI.escape(RITTENHOUSE)}"
    assert last_response.ok?, "Request failed!"
    assert last_response.body.include?(RITTENHOUSE_BAR),
      "That's odd. The bar list works in two addresses but not a third."
  end

end

