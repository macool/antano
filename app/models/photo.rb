class Photo < ActiveRecord::Base
# validations
  validates :title, presence: true

# uploaders
  mount_uploader :image, PhotoImageUploader

# scopes
  scope :sorted, ->{ order(:position, :id) }

# callbacks
  before_create :set_position

# methods
  def tweeted?
    tweet.present?
  end

  def set_position
    if position.to_i == 0
      self.position = self.class.maximum(:position).to_i + 1
    end
  end
end
