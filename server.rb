require "sinatra"

set :bind, '0.0.0.0'


get '/' do
  redirect '/articles'
end

get '/articles' do
  @articles = File.readlines('articles.csv')
  erb :articles
end

get '/articles/new' do
  erb :new
end

post '/articles/new' do
  title = params['title']
  url = params['URL']
  description = params['description']

  File.open('articles.csv', 'a') do |file|
    file.puts(title)
    file.puts(url)
    file.puts(description)
  end

  redirect '/articles'
end
