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
      flash[:failure] = "You did not follow my explicit instructions and shall now be publically shamed!  Or you chose a username that already existed, which is against the rules.  Choose another.....choose wisely."
      redirect 'signup'
    end 
  end 
  
  get '/login' do 
    if logged_in 
      redirect '/games' 
    else 
      erb :'/game_owners/login'
    end 
  end 
  
  post '/login' do 
    @gameowner = GameOwner.find_by(params[:id])
    
  
  get '/logout' do 
    if logged_in? 
      session.destroy 
    else 
      erb :welcome 
    end 
  end 
      
    
  

end