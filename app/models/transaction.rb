class Transaction < ActiveRecord::Base
  belongs_to :user
  validates :token, presence: true
  validates :payerid, presence: true
  validates :ip_address, presence: true

  def pagar?
  	response = procesar_compra
  	self.answer = response.message
  	self.save
  	if response.success?
  		self.user.payments.each do |payment|
  			payment.update(state: 2)
  		end
  		true
  	else
  		false
  	end
  end

  def procesar_compra
  	EXPRESS_GATEWAY.purchase(self.user.costo_compra_pendiente, opciones_compra)
  end

  def opciones_compra
  	{
	  	ip: self.ip_address,
	  	token: self.token,
	  	payer_id: self.payerid
  	}
  end
end
