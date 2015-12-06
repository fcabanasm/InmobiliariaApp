class Apartment < ActiveRecord::Base
 include AASM

	belongs_to :user
	belongs_to :category
  	has_many :pictures, :dependent => :destroy
  	has_many :payments, :dependent => :destroy
  	validates :title, :address, presence: true
  	validates :description, presence: true, length: {minimum:20}
 	accepts_nested_attributes_for :pictures, :reject_if => lambda { |t| t['trip_image'].nil? }
  	validates :latitude, :presence => {message: "Lo sentimos, pero la dirección ingresada no es valida para Google Maps" }
	validates :category, presence: true
  	geocoded_by :address   # can also be an IP address
  	before_validation :geocode, :if => :address_changed?        # auto-fetch coordinates
	validates :bathrooms,presence: true, :numericality => {:greater_than_or_equal_to => 1} 
	validates :rooms,presence: true, :numericality => {:greater_than_or_equal_to => 1} 
	validates :pernightPrice,presence: true, :numericality => {:greater_than_or_equal_to => 10} 
	validates :reservePrice,presence: true, :numericality => {:greater_than_or_equal_to => 10}
	before_save :set_visits_count
	
	scope :ultimos, -> {order("created_at DESC")}
	scope :publicados_sinArrrendar, -> {where(state:"published_unrented")}
  	scope :noPublicados_sinArrendar, -> {where(state: "unpublished_unrented")}
	scope :noPublicados_Arrendados, -> {where(state: "unpublished_rented")}
		
		aasm column: "state" do
			state :unpublished_unrented, initial: true
			state :published_unrented
			state :unpublished_rented

#ADMIN AL PUBLICAR: PUBLICAR un NO-ARRENDADO
			event :adminPublish do
				transitions from: :unpublished_unrented, to: :published_unrented
			end
#ADMIN AL DESPUBLICAR: DESPUBLICAR un NO-ARRENDADO
			event :adminUnPublish do
				transitions from: :published_unrented, to: :unpublished_unrented
			end
#USER AL PAGAR: DESPUBLICAR & DESARRENDAR un PULICADO & NO-ARRENDADO
			event :userPay do
				transitions from: :published_unrented, to: :unpublished_rented
			end
#OWNER FIN ARRIENDO: DESARRENDAR un ARRENDADO
			event :ownerUnRent do
				transitions from: :unpublished_rented, to: :unpublished_unrented
			end

		end

def valores_por_default
	self.price ||= 0
end

def update_visits_count
	self.save if visits_count.nil?
     self.update(visits_count: self.visits_count + 1)
     end

	private

	def  set_visits_count
		self.visits_count ||=0
	end
end
