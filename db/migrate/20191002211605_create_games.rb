class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title 
      t.string :number_of_players
      t.string :est_time_to_play 
      t.string :game_info
      t.integer :game_owner_id
      t.integer :manufacturer_id
      end
   end
end
