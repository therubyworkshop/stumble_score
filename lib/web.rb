require "rubygems"
require "sinatra"
require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

get '/' do
  address = params[:address]
  "<!doctype html>
  <html>
  <head></head>
  <body>
    <h1>Welcome to StumbleScore!</h1>
    <p>Calculating stumble score for #{address}.</p>
  </body>
  </html>"
end

