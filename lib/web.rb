require "rubygems"
require "sinatra"
require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

get '/' do
  address = params[:address]
  "<!doctype html>
  <html>
  <head></head>
  <body>
    <h1>Hello from the Web Interface</h1>
  </body>
  </html>"
end

