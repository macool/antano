class Photo < ActiveRecord::Base
  include Sequence
  include Shareable

  class NoMorePhotosAvailableError < StandardError; end
  class DidNotFinishPublishingError < StandardError; end

  enum status: [:pending, :ready, :publishing, :published]

# relationships
  has_many :shares
  has_many :photo_suggestions, ->{ order(id: :asc) }

# validations
  validates :title, presence: true
  validates :image, presence: true, on: :create

# uploaders
  mount_uploader :image, PhotoImageUploader

# scopes
  scope :sorted, ->{ order(position: :desc, updated_at: :desc, id: :desc) }
  scope :visible, -> { where("status >= ?", statuses[:publishing])}

# callbacks
  before_create :set_position

# methods
  def set_position
    if position.to_i == 0
      self.position = self.class.maximum(:position).to_i + 1
    end
  end

  def to_s
    "#{id} - #{title}"
  end

# class methods
  def self.next_photo
    sorted.where(status: statuses[:ready]).first
  end
end
