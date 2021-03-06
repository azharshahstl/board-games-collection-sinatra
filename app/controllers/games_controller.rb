class GamesController < ApplicationController 
  
  get "/games" do
    redirect_if_not_logged_in
    @games = Game.all
    erb :'/games/games'
  end
  
  get "/games/new" do 
    redirect_if_not_logged_in
    erb :'/games/new' 
  end 
  
  get "/games/:id" do
    redirect_if_not_logged_in
      @game = Game.find_by_id(params[:id])
      erb :"/games/show_game" 
      redirect "/login"  
  end 
  
  post "/new" do 
    redirect_if_not_logged_in
    @game = Game.new(title: params[:title], number_of_players: params[:number_of_players], est_time_to_play: params[:est_time_to_play], game_info: params[:game_info])
    @manufacturer = Manufacturer.find_by(name: params[:manufacturer])
    if @manufacturer 
      @game.manufacturer_id = @manufacturer.id
      @game.game_owner_id = current_user.id
      @game.save
    else
      @manufacturer = Manufacturer.new(name: params[:manufacturer])
      @manufacturer.save
      @game.game_owner_id = current_user.id
      @game.manufacturer_id = @manufacturer.id
      @game.save
    end
    if @game.save && @manufacturer.save
       redirect "/games/#{@game.id}"
    else
       flash[:new_game_failure] = "You are part of the Rebel Alliance and clearly do not know how to complete all the fields in the Empires' computer system.  Try it again and then off to the incinerators with you!"
       redirect "/games/new" 
    end 
  end
  
  get "/games/:id/edit" do 
    if logged_in? 
      @game = Game.find_by_id(params[:id])
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
    @game = Game.find_by_id(params[:id])
    if params[:title] == "" || params[:number_of_players] == "" || params[:est_time_to_play] == "" || params[:game_info] == ""
      
      flash[:edit_failure] = "You task me... You task me and I shall have you.  You know you can't leave any fields blank."
      
      redirect "/games/#{@game.id}/edit"
      
    else 
      @manufacturer = Manufacturer.find_or_create_by(name: params[:manufacturer])
        if @game && @game.game_owner_id == current_user.id 
           @game.update(title: params[:title], number_of_players: params[:number_of_players], est_time_to_play: params[:est_time_to_play], game_info: params[:game_info])
           @game.manufacturer_id = @manufacturer.id
           @game.save
       
           redirect "/games/#{@game.id}"
        else 
           redirect "/games"
        end
     end
   end
      
      
  
  delete "/games/:id/delete" do
    if logged_in?
      @game = Game.find_by_id(params[:id])
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