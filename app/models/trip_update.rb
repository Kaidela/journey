class TripUpdate < ActiveRecord::Base
  
  has_many :trip_update_images
  has_many :images, through: :trip_update_images

end
