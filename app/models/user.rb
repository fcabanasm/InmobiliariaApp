class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :apartments
  has_many :payments
  has_many :transactions
  #validates :email, presence: true, uniqueness: true
  validates :name, presence: true, length:{in:4..20, 
  			too_short:"Revisa el nombre ingresado, parece demasiado corto", 
  			too_long:"Revisa el nombre ingresado, parece demasiado largo"}
  			#,format: {with: /([]+)/, message: "El nombre solo puede contener letras"}
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

def costo_compra_pendiente
  payments.where(state: 1).joins("INNER JOIN apartments on apartments.id = payments.apartment_id").sum("price")
  
end

end