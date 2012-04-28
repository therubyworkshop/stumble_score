require "rubygems"
require "net/https"
require "uri"
require "json"

module StumbleScore

  class Location
    GOOGLE_KEY    = "AIzaSyCTPREzeJUXKz4-aQOH-CbnNqtcl9DzDlA"
    RADIUS        = 2000 # (meters)
    CRITERIA      = URI.escape("bar|pub")
    MAGIC_NUMBER  = 20

    def initialize(address)
      # TODO
    end

    def score
      0
    end

    def classification
      # TODO
    end

    def bar_names
      # TODO
    end

    def bar_count
      # TODO
    end

    def bars
      # TODO
    end

    def geocode
      # TODO
    end

    def ask_the_google(uri)
      session              = Net::HTTP.new(uri.host, uri.port)
      session.use_ssl      = true
      session.verify_mode  = OpenSSL::SSL::VERIFY_NONE
      request              = Net::HTTP::Get.new(uri.request_uri)
      response             = session.request(request)
      json                 = response.body
      JSON.parse(json)
    end

  end

end
