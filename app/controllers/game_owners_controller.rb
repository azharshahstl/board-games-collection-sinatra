class GameOwnersController < ApplicationController 

  get '/signup' do
    if logged_in? 
      erb :'/game_owners/index'
    else 
      erb :'/game_owners/signup'
    end
  end
  
  post '/signup' do 
    @gameowner = GameOwner.new(username: params[:username], email: params[:email], password: params[:password])
    if @gameowner.save
      session[:user_id] = @gameowner.id
      
      erb :'/game_owners/index' 
    else 
      flash[:failure_signup] = "You did not follow my explicit instructions and shall now be publically shamed!  Or you chose a username that already existed, which is against the rules.  Choose another.....choose wisely."
      
      redirect '/signup'
    end 
  end 
  
  get '/login' do 
    if logged_in? 
      erb :'game_owners/index' 
    else 
      erb :'/game_owners/login'
    end 
  end 
  
  post '/login' do 
    @gameowner = GameOwner.find_by(username: params[:username])
    if @gameowner && @gameowner.authenticate(params[:password])
       session[:user_id] = @gameowner.id
       erb :'/game_owners/index'
    else
      flash[:failure_login] = "Enter your username and password correctly, or you will have failed me for the last time Game Owner." 
      redirect '/login'
    end 
  end 
  
  get '/logout' do 
    if logged_in? 
      session.destroy 
      erb :welcome
    else 
      erb :welcome 
    end 
  end 
  
  get '/movie' do 
    if logged_in? 
      erb :"/game_owners/movie" 
    else 
      redirect "/login" 
    end 
  end 
      
    
  

end