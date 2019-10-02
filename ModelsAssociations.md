Model: Game_owner
attributes: username, email, password

Associations: has_many: games
            



Model: Game
attributes: title, manufacturer, review, number_of_players, est_time_to_play

Associations: has_many :game_owners
              belongs_to :manufacturer 
              
              


Model: Manufacturer 
attributes: name, location 

Associations: has_many :games 
    
              
