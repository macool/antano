class PhotoSuggestion < ActiveRecord::Base
# validations
  validates :user_id, presence: true
  validates :photo_id, presence: true
  validate :validate_has_content

# relationships
  belongs_to :user
  belongs_to :photo

# methods
  def validate_has_content
    errors.add(:base, "No puede estar en blanco") if blank?
  end

  def blank?
    title.blank? && description.blank? && year.blank? && place.blank? && people.blank?
  end
end
