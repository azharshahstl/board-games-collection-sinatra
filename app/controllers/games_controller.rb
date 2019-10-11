class GamesController < ApplicationController 
  
  get "/games" do
    if logged_in?
      @games = Game.all
    erb :'/games/games'
    else 
      redirect '/login'
    end
  end
  
  get "/games/new" do 
    if logged_in?
      erb :'/games/new'
    else 
      redirect '/login' 
    end 
  end 
  
  get "/games/:id" do
    if logged_in?
      @game = Game.find_by(params[:id])
      erb :"/games/show_game" 
    else
      redirect "/login" 
    end 
  end 
  
  post "/new" do 
    @game = Game.new(title: params[:title], number_of_players: params[:number_of_players], est_time_to_play: params[:est_time_to_play], game_info: params[:game_info])
    @manufacturer = Manufacturer.new(name: params[:manufacturer])
    @manufacturer.save
    @game.game_owner_id = current_user.id
    @game.manufacturer_id = @manufacturer.id
    @game.save
  binding.pry
    if @game.save && @manufacturer.save
       redirect "/games/#{@game.id}"
    else
       flash[:new_game_failure] = "You are part of the Rebel Alliance and clearly do not know how to complete all the fields in the Empires' computer system.  Try it again and then off to the incinerators with you!"
       redirect "/games/new" 
     end 
  end
  
  get "/games/:id/edit" do 
    if logged_in? 
      @game = Game.find_by(params[:id]) 
      if @game && @game.game_owner_id == current_user.id
         
          erb :"/games/edit_game"
          
      else 
          redirect "/games/#{@game.id}"
      end
    else
      redirect '/login'
    end
  end
  
  patch "/games/:id" do
    if params[:title] == "" || params[:number_of_players] == "" || params[:est_time_to_play] == "" || params[:game_info] == ""
      
      flash[:edit_failure] = "You task me... You task me and I shall have you.  You know you can't leave any fields blank."
      
      redirect "/games/#{@games.id}/edit"
      
    else 
      @game = Game.find_by(params[:id]) 
        if @game && @game.game_owner_id == current_user.id 
           @game = Game.update(title: params[:title], number_of_players: params[:number_of_players], est_time_to_play: params[:est_time_to_play], game_info: params[:game_info])
       
           redirect "/games/#{@game.id}"
        else 
           redirect "/games"
        end
     end
   end
      
      
  
  delete "/games/:id/delete" do
    if logged_in?
      @game = Game.find_by(params[:id])
       if @game && @game.game_owner_id == current_user.id
          @game.delete
          redirect "/games"
       else 
          redirect "/games/#{@game.id}"
       end
    else
      redirect '/login'
    end
  end
    
    
end