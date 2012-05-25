require 'rubygems'
require 'sinatra'
require 'twitter'
require 'json'
require 'net/http'
require File.dirname(__FILE__) + '/lib/picasa'


before do
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

get '/style.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss :style
end

