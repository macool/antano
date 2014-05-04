class Profile < ActiveRecord::Base
  include Omniauthable
  include Fetchable

# relationships
  belongs_to :user

# serializations
  serialize :urls
  serialize :raw_info

# validations
  validates :user_id, presence: true
  validates :uid, presence: true, uniqueness: true

# methods
  def image_big_url
    image.tap {|u| u.slice!("_normal")}
  end
end
