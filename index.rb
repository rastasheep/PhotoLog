require 'rubygems'
require 'sinatra'
require 'json'
require 'net/http'
require './lib/picasa'

before do
  @homeurl = "http://photolog.heroku.com"
  @name = "109490003681682232613"
  @blog = "5746190409335238577"
  @portfolio = "5746190563675628609"
  @user = PicasaAPI::user(@name)
end

get '/' do
  @album = PicasaAPI::album(@name, @blog)
  @title = "Pictures everywhere:"
  erb :index, :locals => {:url => @blog}
end

get '/portfolio' do
  @album = PicasaAPI::album(@name, @portfolio)
  @title = "Portfolio:"
  erb :index, :locals => {:url => @portfolio}
end

get '/about' do
  @title = "About:"
  erb :about
end

get '/rss' do
  @album = PicasaAPI::album(@name, @blog)
  content_type 'application/rss+xml'
  erb :rss, :layout => false
end

not_found do
  @title = "Not found:"
  erb :"404"
end