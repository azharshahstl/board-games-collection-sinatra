class GameOwner < ActiveRecord::Base 
  has_secure_password
  has_many :games
  validates :username, :email, :password_digest, presence: true
  validates :username, uniqueness: true
end