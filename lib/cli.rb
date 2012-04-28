require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

class CLI

  def self.run(address="")
    if address.length > 1
      "Welcome to StumbleScore!\n" \
      "Calculating stumble score for \"#{address}\"."
    else
      "Usage: stumble_score <location> \n" \
      " e.g.: stumble_score 19118"
    end
  end

end
