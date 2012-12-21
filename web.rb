require 'bundler/setup'
require 'sinatra'
require 'json'

require './erowid_scraper'

##### API

get '/psychoactives/:id.json' do |id|
  @psychoactive = ErowidScraper.scrape(id)
  halt 404 unless @psychoactive

  content_type :json
  @psychoactive.to_json
end

##### Web

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

#### Config

set :port, ENV['PORT'] || 5000

error { erb :error }
not_found { erb :not_found }
