class GameOwnersController < ApplicationController 

  get '/signup' do
    if logged_in? 
      redirect '/games'
    else 
      erb :'/game_owners/signup'
    end
  end
  
  post '/signup' do 
    @gameowner = GameOwner.new(username: params[:username], email: params[:email], password_digest: params[:password])
    if @gameowner.save 
      erb :'games/games' 
    else 
      flash[:failure] = "You did not follow my explicit instructions and now shall be publically shamed!  Or you choose a username that already existed, which is against the rules.  Choose another.....choose wisely."
      redirect 'signup'
    end 
  end 
    
  

end