# Dans cette partie, nous avons créé une classe ApplicationController qui hérite (<) de la classe Sinatra::Base. 
# Grâce à l'héritage, ApplicationController aura toutes les fonctionnalités que propose la classe Sinatra::Base 
#(= toutes les fonctionnalités de base de Sinatra).

class ApplicationController < Sinatra::Base 
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new' do
    erb :new_gossip
  end
  post '/gossips/new' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
  get '/gossips/:id' do
    # matches "GET /hello/foo" and "GET /hello/bar"
    # params['name'] is 'foo' or 'bar'
    puts "Voici le numéro du potin que tu veux : #{params['id']}!"
  end
end