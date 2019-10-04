class GameOwnersController < ApplicationController 

get '/signup' do 
    if logged_in? 
      redirect '/tweets'
    else 
      erb :'/users/signup'
    end
  end




end