class Station < ActiveRecord::Base
  
  validates :lat, presence: true
  validates :long, presence: true
  validates :num_docks, presence: true

  def to_param
    "#{tfl_id}"
  end
end
