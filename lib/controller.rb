# Dans cette partie, nous avons créé une classe ApplicationController qui hérite (<) de la classe Sinatra::Base. 
# Grâce à l'héritage, ApplicationController aura toutes les fonctionnalités que propose la classe Sinatra::Base 
#(= toutes les fonctionnalités de base de Sinatra).
require 'gossip'
class ApplicationController < Sinatra::Base 
  get '/' do
    erb :index
  end
  get '/gossips/new' do
    erb :new_gossip
  end
  post '/gossips/new' do
    Gossip.new.save
  end

end