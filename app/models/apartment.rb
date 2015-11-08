class Apartment < ActiveRecord::Base
  belongs_to :user
  has_many :attachments
  validates :name, presence: true

end
