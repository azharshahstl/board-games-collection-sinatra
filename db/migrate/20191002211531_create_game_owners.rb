class CreateGameOwners < ActiveRecord::Migration
  def change
    create_table :game_owners do |t| 
    t.string :username 
    t.string :email 
    t.string :password_digest
    end
  end
end
