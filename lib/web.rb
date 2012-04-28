require "rubygems"
require "sinatra"
require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

get '/' do
  address = params[:address]
  if address && address.length > 1
    location        = StumbleScore::Location.new(address)
    bar_count       = location.bar_count
    classification  = location.classification
    score           = location.score
    bar_names       = location.bar_names
    "<!doctype html>
    <html>
    <head></head>
    <body>
      <h1>Welcome to StumbleScore!</h1>
      <p>Calculating stumble score for #{address}.</p>
      <p>Bar count: #{bar_count}</p>
      <p>Bars nearby: #{bar_names}</p>
      <p>Classified as: #{classification}</p>
      <p>StumbleScore: #{location.score}</p>
    </body>
    </html>"
  else
    "<!doctype html>
    <html>
    <head></head>
    <body>
      <h1>Welcome to StumbleScore!</h1>
      <p>An address parameter is required e.g. http://www.stumblescore.com?address=rittenhouse%20square,%20pa</p>
    </body>
    </html>"
  end
end

