class Sighting < ActiveRecord::Base
  
  # A sighting is of a specific bike.
  belongs_to :bike

  # A sighting has an associated photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default.png"
  # validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  do_not_validate_attachment_file_type :photo

  validates :lat, presence: true
  validates :long, presence: true
end
