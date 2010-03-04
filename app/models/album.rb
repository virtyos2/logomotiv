class Album < ActiveRecord::Base
  has_many :album_photos
  
end
