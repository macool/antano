class Photo < ActiveRecord::Base
  include Tweetable

# validations
  validates :title, presence: true

# uploaders
  mount_uploader :image, PhotoImageUploader

# scopes
  scope :sorted, ->{ order(:position, :id) }
  scope :unpublished, -> { where(tweet: nil) }

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

# class methods
  def self.next_photo
    sorted.unpublished.first
  end
end
