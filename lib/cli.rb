require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

class CLI

  def self.run(address="")
    if address.length > 1
      location        = StumbleScore::Location.new(address)
      bar_count       = location.bar_count
      score           = location.score
      classification  = location.classification
      bar_names       = location.bar_names
      "Welcome to StumbleScore!\n" \
      "Calculating stumble score for \"#{address}\".\n" \
      "Bar count: #{bar_count}\n" \
      "Bars nearby: #{bar_names}\n" \
      "Classified as: #{classification}\n" \
      "StumbleScore: #{location.score}"
    else
      "Usage: stumble_score <location> \n" \
      " e.g.: stumble_score 19118"
    end
  end

end
