require "rubygems"
require "sinatra"
require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

get '/' do
  address         = params[:address]
  location        = StumbleScore::Location.new(address)
  bar_count       = location.bar_count
  score           = location.score
  classification  = location.classification
  bar_names       = location.bar_names
  "<!doctype html>
  <html>
  <head></head>
  <body>
    <h1>Welcome to StumbleScore!</h1>
  </body>
  </html>"
end

