class GameOwner < ActiveRecord::Base 
  has_secure_password
  has_many :games
  validates :username, :email, presence: true
  validates :username, uniqueness: true
end