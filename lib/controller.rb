require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
   erb :show, locals: {gossips: Gossip.find(params['id'])}
  end

  get '/gossips/:id/edit/' do
    erb :edit
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
   end

  get '/gossips/:id/com/' do
    erb :com
  end

  post '/gossips/:id/com/' do
    Comment.new(params["author_com"], params["content_com"]).save_com
    redirect '/'
  end

end