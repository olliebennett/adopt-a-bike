class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.float :lat
      t.float :long
      t.timestamp :time

      t.timestamps
    end
  end
end
