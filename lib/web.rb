require "rubygems"
require "sinatra"
require File.expand_path(File.join('..', 'stumble_score'), __FILE__)

get '/' do
  "Hello from the Web Interface"
end

