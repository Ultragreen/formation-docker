require 'sinatra'
require 'mongo'
require 'erb'

# Configuration de MongoDB
client = Mongo::Client.new(['mongo:27017'], database: 'blog')
posts_collection = client[:posts]

# Initialiser un post de test
if posts_collection.count_documents == 0
  posts_collection.insert_one(title: 'Bienvenue sur mon blog', content: 'Ceci est un post de test.')
end


get '/' do
  @posts = posts_collection.find.to_a
  erb :index
end

post '/add' do
  posts_collection.insert_one(title: params[:title], content: params[:content])
  redirect '/'
end
