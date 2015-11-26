class Apartment < ActiveRecord::Base
 include AASM

	belongs_to :user
  	has_many :pictures, :dependent => :destroy
  	validates :title, :address, presence: true
 	accepts_nested_attributes_for :pictures, :reject_if => lambda { |t| t['trip_image'].nil? }
  	validates :latitude, :presence => {message: "Lo sentimos, pero la dirección ingresada no es valida para Google Maps" }

  	geocoded_by :address   # can also be an IP address
  	before_validation :geocode, :if => :address_changed?         # auto-fetch coordinates
	

	scope :publicados, -> {where(state:"published")}
  	scope :ultimos, -> {order("created_at DESC")}

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


end
