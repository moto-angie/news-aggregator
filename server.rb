require "sinatra"
require 'csv'

set :bind, '0.0.0.0'

get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = CSV.read('articles.csv')
  erb :articles
end

get '/articles/new' do
  erb :new
end

post '/articles/new' do
  @title = params['title']
  @url = params['url']
  @description = params['description']

  CSV.open('articles.csv', 'a') do |file|
    file << [@title,@url,@description]
  end

  redirect '/articles'
end
