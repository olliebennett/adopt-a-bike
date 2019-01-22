class Bike < ActiveRecord::Base
  
  # A bike can be sighted many times!
  has_many :sightings, dependent: :destroy

  validates :number, presence: true

  def to_param
    "#{number}"
  end
end
