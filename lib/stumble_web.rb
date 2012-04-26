require "rubygems"
require "sinatra"
require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

get '/' do
  address = params[:address]
  if address && address.length > 1
    location        = StumbleScore::Location.new(address)
    bar_count       = location.bar_count
    "<!doctype html>
    <html>
    <head></head>
    <body>
      <h1>Welcome to StumbleScore!</h1>
      <p>Calculating stumble score for #{address}.</p>
      <p>Bar count: #{bar_count}</p>
    </body>
    </html>"
  else
    "<!doctype html>
    <html>
    <head></head>
    <body>
      <p>An address parameter is required</p>
    </body>
    </html>"
  end
end

