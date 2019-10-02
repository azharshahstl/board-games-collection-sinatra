class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title 
      t.string :manufacturer 
      t.integer :number_of_players
      t.string :est_time_to_play 
      t.string :game_info
      end
   end
end
