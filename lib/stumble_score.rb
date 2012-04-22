require "net/http"
require "uri"
require "json"

module StumbleScore

  class CLI

    def self.run(address="")
      if address.length > 1
        location  = Location.new(address)
        bar_count = location.bar_count
        score     = location.score
        "Welcome to StumbleScore!\n" \
        "Calculating stumble score for \"#{address}\".\n" \
        "Bars nearby: #{bar_count}\n" \
        "StumbleScore: #{location.score}"
      else
        "Usage: stumble_score <location> \n" \
        " e.g.: stumble_score 19118"
      end
    end

  end

  class Location
    GOOGLE_KEY    = "AIzaSyCTPREzeJUXKz4-aQOH-CbnNqtcl9DzDlA"
    RADIUS        = 2000 # (meters)
    CRITERIA      = URI.escape("bar|pub")
    MAGIC_NUMBER  = 20

    def score
      # Extra credit for making this non-linear
      100.0 * self.bar_count.to_f / MAGIC_NUMBER
    end

    def initialize(address)
      @address = address
    end

    def bar_count
      uri = URI::HTTPS.build({
        :host  => "maps.googleapis.com",
        :path  => "/maps/api/place/search/json",
        :query => "location=#{self.geocode}&" \
                  "radius=#{RADIUS}&" \
                  "keyword=#{CRITERIA}&" \
                  "sensor=false&" \
                  "key=#{GOOGLE_KEY}"
      })
      parsed = self.ask_the_google(uri)
      parsed["results"].length
    end

    def geocode
      escaped_address = URI.escape(@address)
      uri = URI::HTTPS.build({
        :host  => "maps.googleapis.com",
        :path  => "/maps/api/geocode/json",
        :query => "address=#{escaped_address}&" \
                  "sensor=false"
      })
      parsed   = self.ask_the_google(uri)
      location = parsed["results"][0]["geometry"]["location"]
      "#{location["lat"]},#{location["lng"]}"
    end

    def ask_the_google(uri)
      http          = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl  = true
      request       = Net::HTTP::Get.new(uri.request_uri)
      response      = http.request(request)
      json          = response.body
      JSON.parse(json)
    end

  end

end
