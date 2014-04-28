class User < ActiveRecord::Base
  include Authenticable

# relationships
  has_one :profile
  
# validations
  validates :nombres, presence: true
end
