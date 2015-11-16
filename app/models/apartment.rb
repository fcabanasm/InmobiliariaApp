class Apartment < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, :dependent => :destroy
  validates :title, presence: true
  accepts_nested_attributes_for :pictures, :reject_if => lambda { |t| t['trip_image'].nil? }
end
