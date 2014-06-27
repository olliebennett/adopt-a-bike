class AddSightingsToBikes < ActiveRecord::Migration
  def change
    add_reference :bikes, :sighting, index: true
  end
end
