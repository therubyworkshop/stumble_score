require "rubygems"
require "net/https"
require "uri"
require "json"

module StumbleScore

  class CLI

    def self.run(address="")
      if address.length > 1
        location        = Location.new(address)
        bar_count       = location.bar_count
        score           = location.score
        classification  = location.classification
        "Welcome to StumbleScore!\n" \
        "Calculating stumble score for \"#{address}\".\n" \
        "Bars nearby: #{bar_count}\n" \
        "Classified as: #{classification}\n" \
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

    def classification
      case self.score.to_i
      when 0..33
        "Dry"
      when 34..66
        "Tipsy"
      when 76..100
        "Sloppy"
      end
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
