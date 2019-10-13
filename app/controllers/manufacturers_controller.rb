class ManufacturersController < ApplicationController
  
  get '/manufacturers' do 
    if logged_in?
      @manufacturers = Manufacturer.all 
      erb :'manufacturers/manufacturers'
    else 
      redirect '/login'
    end
  end
  
  
end