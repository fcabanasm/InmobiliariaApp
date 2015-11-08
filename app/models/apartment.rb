class Apartment < ActiveRecord::Base
  belongs_to :user
  has_many :attachments
  validates :title, presence: true

end
