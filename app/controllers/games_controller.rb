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
  
  post "/new" do 
    @game = Game.new(title: params[:title], number_of_players: params[:number_of_players], est_time_to_play: params[:est_time_to_play], game_info: params[:game_info])
    @game.gameowner_id = current_user.id
    @game.save
    
    redirect "/games/#{@game.id}"
  end
  
  get "games/:id" do
    if logged_in?
      @game = Game.find_by(params[:id])
      erb :"/games/show_game" 
    else
      redirect "/login" 
    end 
  end 
    
    
    
end