class User < ActiveRecord::Base
  include Authenticable
  include Managementable

# relationships
  has_one :profile

# validations
  validates :nombres, presence: true
end
