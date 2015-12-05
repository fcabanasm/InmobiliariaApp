class Apartment < ActiveRecord::Base
 include AASM

	belongs_to :user
	belongs_to :category
  	has_many :pictures, :dependent => :destroy
  	has_many :payments
  	validates :title, :address, presence: true
  	validates :description, presence: true, length: {minimum:20}
 	accepts_nested_attributes_for :pictures, :reject_if => lambda { |t| t['trip_image'].nil? }
  	validates :latitude, :presence => {message: "Lo sentimos, pero la dirección ingresada no es valida para Google Maps" }
	validates :category, presence: true
  	geocoded_by :address   # can also be an IP address
  	before_validation :geocode, :if => :address_changed?        # auto-fetch coordinates
	validates :bathrooms,presence: true, :numericality => {:greater_than_or_equal_to => 1} 
	validates :rooms,presence: true, :numericality => {:greater_than_or_equal_to => 1} 
	validates :price,presence: true, :numericality => {:greater_than_or_equal_to => 10} 
	validates :reserveprice,presence: true, :numericality => {:greater_than_or_equal_to => 10}
	scope :publicados, -> {where(state:"published")}
  	scope :ultimos, -> {order("created_at DESC")}
  	scope :desarrendados, -> {where(is_rented: "false")}

		aasm column: "state" do
		state :in_draft, initial: true
		state :published

		event :publish do
		transitions from: :in_draft,to: :published
		end

		event :unpublish do
			transitions from: :published,to: :in_draft
		end

		end

def valores_por_default
	self.price ||= 0
end
end
