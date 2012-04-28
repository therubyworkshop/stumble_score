require File.expand_path(File.join('..', 'test_helper'), __FILE__)

class TestStumbleWeb < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_page_greets_user
    get "/"
    assert last_response.ok?, "Request failed!"
    assert_match /Welcome to StumbleScore/i, last_response.body,
      "TODO Add a nice greeting to our page. " \
      "(HINT: look at the block passed to get() in web.rb)"
  end

end

