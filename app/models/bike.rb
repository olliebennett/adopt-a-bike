class Bike < ActiveRecord::Base
  has_many :sightings, dependent: :destroy
end
