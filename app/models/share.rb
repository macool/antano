class Share < ActiveRecord::Base
# relationships
  belongs_to :photo

# validations
  validates :photo_id, presence: true
  validates :provider, presence: true
  validates :obj, presence: true

# serializations
  serialize :obj
end
