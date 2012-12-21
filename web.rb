require 'bundler/setup'
require 'sinatra'
require 'json'

require './erowid_scraper'

set :port, ENV['PORT'] || 5000

get '/' do
  erb :home
end

get '/about' do
  erb :about
end

get '/psychoactives/:id' do |id|
  @psychoactive = ErowidScraper.scrape(id)
  halt 404 unless @psychoactive

  erb :psychoactive
end

error { erb :error }
not_found { erb :not_found }
