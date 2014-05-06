class Photo < ActiveRecord::Base
  include Sequence
  include Shareable

  class NoMorePhotosAvailableError < StandardError; end

  enum status: [:pending, :ready, :publishing, :published]

# relationships
  has_many :shares

# validations
  validates :title, presence: true
  validates :image, presence: true

# uploaders
  mount_uploader :image, PhotoImageUploader

# scopes
  scope :sorted, ->{ order(:position, :id) }

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
