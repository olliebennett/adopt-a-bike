class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.float :lat
      t.float :long
      t.string :name
      t.integer :num_docks
      t.integer :tfl_id

      t.timestamps
    end
  end
end
