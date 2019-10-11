class Game < ActiveRecord::Base 
  belongs_to :manufacturer 
  has_many :game_owners
  validates :title, :number_of_players, :est_time_to_play, :manufacturer, presence :true
  
end