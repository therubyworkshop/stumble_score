require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

class CLI

  def self.run(address="")
    "Welcome to StumbleScore!\n" \
    "Calculating stumble score for \"#{address}\"."
  end

end
