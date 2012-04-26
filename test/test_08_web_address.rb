require File.expand_path(File.join('..', 'test_helper'), __FILE__)
require "rubygems"
require 'rack/test'
require File.expand_path(File.join('..', '..', 'lib', 'stumble_web'), __FILE__)

ENV['RACK_ENV'] = 'test'

class TestStumbleWeb < Test::Unit::TestCase
  include LocationFixtures
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_page_includes_address
    get "/?address=#{URI.escape(CHESTNUT_HILL)}"
    assert last_response.ok?, "Request failed!"
    assert last_response.body.include?(CHESTNUT_HILL),
      "TODO display specified address on page. " \
      "(HINT: look at the block passed to get() in stumble_web.rb)"
  end

end

