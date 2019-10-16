require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
		set :session_secret, "chappie"
		register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end
  
  helpers do 
    def logged_in?
      !!session[:user_id]
    end
    
    def current_user 
      GameOwner.find(session[:user_id])
    end
    
    def slug
      title.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
      Game.all.find {|game| game.slug == slug}
    end

    def redirect_if_not_logged_in
      if !logged_in? 
        redirect '/login' 
      end
    end
  end

end
