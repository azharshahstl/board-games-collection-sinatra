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
      flash[:failure_signup] = "You did not follow my explicit instructions and shall now be publically shamed!  Or you chose a username that already existed, which is against the rules.  Choose another.....choose wisely."
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
    @gameowner = GameOwner.find_by(params[:username])
    if @gameowner && @user.authenticate(params[:password])
       session[:user_id] = @gameowner.id
       redirect '/games'
    else
      flash[:failure_login] = "Enter your username and password correctly, or you will have failed me for the last time Game Owner." 
      redirect '/login'
    end 
  end 
      
      
      
    
  
  get '/logout' do 
    if logged_in? 
      session.destroy 
    else 
      erb :welcome 
    end 
  end 
      
    
  

end