require 'bundler/setup'
require 'sinatra'
require 'json'
require 'uri'

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

get '/search' do
  if slug = ErowidScraper.search(params[:q])
    redirect "/psychoactives/#{slug}"
  else
    redirect "https://www.google.com/#q=" + URI.encode("site:erowid.org #{params[:q]}")
  end
end

#### Config

set :port, ENV['PORT'] || 5000

error { erb :error }
not_found { erb :not_found }
