class AddBikeToSightings < ActiveRecord::Migration
  def change
    add_reference :sightings, :bike, index: true
  end
end
