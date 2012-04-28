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
      @address = address
    end

    def bar_count
      self.bars.length
    end

    def score
      100.0 * self.bar_count.to_f / MAGIC_NUMBER
    end

    def classification
      # TODO
    end

    def bar_names
      # TODO
    end

    def bars
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
      parsed["results"]
    end

    def geocode
      raise "@address instance variable not set!" unless @address
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
