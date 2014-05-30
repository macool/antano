class PhotoSuggestion < ActiveRecord::Base
# validations
  validates :user_id, presence: true
  validates :photo_id, presence: true

# relationships
  belongs_to :user
  belongs_to :photo
end
