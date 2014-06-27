class Station < ActiveRecord::Base
  
  def to_param
    "#{tfl_id}"
  end
  
end
