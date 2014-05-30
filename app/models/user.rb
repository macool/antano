class User < ActiveRecord::Base
  include Authenticable
  include Managementable

# relationships
  has_one :profile
  has_many :photo_suggestions

# validations
  validates :nombres, presence: true
end
