require 'bundler/setup'
require 'sinatra'

set :port, ENV['PORT'] || 5000

get '/' do
  erb :home
end

get '/about' do
  erb :about
end

get '/psychoactives/:id' do
  erb :psychoactive
end
