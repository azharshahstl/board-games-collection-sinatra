class GameOwnersController < ApplicationController 

  get '/signup' do
    if logged_in? 
      redirect '/games'
    else 
      erb :'/game_owners/signup'
    end
  end
  

end