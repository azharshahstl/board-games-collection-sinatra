class CreateManufacturers < ActiveRecord::Migration
  def change
    creat_table :manufacturers do |t|
      t.string :name 
      t.string :location
    end
  end
end
