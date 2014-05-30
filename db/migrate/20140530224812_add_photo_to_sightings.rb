class AddPhotoToSightings < ActiveRecord::Migration
  def change
    change_table :sightings do |t|
      t.attachment :photo
    end
  end
end
