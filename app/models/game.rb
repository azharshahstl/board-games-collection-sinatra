class Game < ActiveRecord::Base 
  belongs_to :manufacturer 
  has_many :game_owners
end