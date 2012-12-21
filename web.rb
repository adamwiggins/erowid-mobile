require 'bundler/setup'
require 'sinatra'

require './erowid-scraper'

set :port, ENV['PORT'] || 5000

get '/' do
  erb :home
end

get '/about' do
  erb :about
end

get '/psychoactives/:id' do |id|
  @psychoactive = ErowidScraper.new(id)
  erb :psychoactive
end
