class Bike < ActiveRecord::Base
  
  # A bike can be sighted many times!
  has_many :sightings, dependent: :destroy

end
