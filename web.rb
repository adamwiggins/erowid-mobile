require 'bundler/setup'
require 'sinatra'
require 'json'
require 'uri'

require './erowid_scraper'

STDOUT.sync = STDERR.sync = true

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
  log :search, :q => params[:q]

  if slug = ErowidScraper.search(params[:q])
    redirect "/psychoactives/#{slug}"
  else
    redirect "https://www.google.com/#q=" + URI.encode("site:erowid.org #{params[:q]}")
  end
end

#### Helpers

def log(event, args={})
  kv = args.map do |key, value|
    "#{key}=#{value.gsub("'", %q(\\\'))}"
  end

  msg = "event_#{event} " + kv.join(' ')

  puts msg
end

#### Config

set :port, ENV['PORT'] || 5000

not_found do
  log :page_not_found
  erb :not_found
end

error do
  log(:error, :error => env['sinatra.error'].name, :msg => env['sinatra.error'].message)
  erb :error
end
