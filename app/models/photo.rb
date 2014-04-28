class Photo < ActiveRecord::Base
# validations
  validates :title, presence: true

# uploaders
  mount_uploader :image, PhotoImageUploader
end
