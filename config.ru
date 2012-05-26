require 'rubygems'
require 'sinatra'
require 'index.rb'


# logging
set :raise_errors, true
log = File.new("log/sinatra.log", "a+")
STDOUT.reopen(log)
STDERR.reopen(log)

run LightPicasa