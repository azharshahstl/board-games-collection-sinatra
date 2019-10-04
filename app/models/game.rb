class Game < ActiveRecord::Base 
  belongs_to :manufacturer 
  has_many :game_owners
  
  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Game.all.find { |game| game.slug == slug }
  end
end