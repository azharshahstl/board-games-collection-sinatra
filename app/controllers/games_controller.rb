class GamesController < ApplicationController 
  
  get "/games" do
    if logged_in?
      @games = Game.all
    erb :'/games/games'
    else 
      redirect '/gameowners/login'
    end
  end
    
end