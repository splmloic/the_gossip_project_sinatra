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
    erb :show, locals: {id: params['id'].to_i, gossip: Gossip.find(params['id'].to_i)}
  end
  get '/gossips/:id/edit' do
    erb :edit, locals: {id: params['id'].to_i, gossip: Gossip.find(params['id'].to_i)}
  end
  post '/gossips/:id/edit' do
    #j'ai crée gossip id car sinon erreur
    gossip_id = params['id'].to_i
    gossip = Gossip.find(gossip_id)
    gossip.update(gossip_id,params["gossip_author"], params["gossip_content"])
    redirect "/"
  end
end