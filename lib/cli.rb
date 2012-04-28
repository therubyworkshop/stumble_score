require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

class CLI

  def self.run(address="")
    if address.length > 1
      location  = StumbleScore::Location.new(address)
      bar_count = location.bar_count
      score     = location.score
      "Welcome to StumbleScore!\n" \
      "Calculating stumble score for \"#{address}\".\n" \
      "Bar count: #{bar_count}\n" \
      "StumbleScore: #{score}"
    else
      "Usage: stumble_score <location> \n" \
      " e.g.: stumble_score 19118"
    end
  end

end
