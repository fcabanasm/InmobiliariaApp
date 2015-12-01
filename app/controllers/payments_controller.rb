class PaymentsController < ApplicationController
	before_action :authenticate_user!

	def create
		if current_user.payments.where(:payments => apartment_params, :state => 1).count < 1
			@payment = current_user.payments.new(apartment_params)
			respond_to do |format|
				if @payment.save
					format.html{redirect_to shop_path}
					format.json{head :no_content}
				else
					redirect_to Apartment.find(apartment_params[:apartment_id]),error: "No pudimos procesar tu compra"
					format.json{head :no_content}
				end
			end
		else
			respond_to do |format|
				format.html{redirect_to shop_path}
				format.json{head :no_content}
			end
		end

	end

	def shop
		@payments = current_user.payments.where(state: 1)
	end

	def express
		cost = current_user.costo_compra_pendiente
		response = EXPRESS_GATEWAY.setup_purchase(cost,
			ip: request.remote_ip,
			return_url: "http://localhost:3000/transactions/checkout",
			cancel_return_url: "http://localhost:3000/shop",
			name: "Chekout de compras en LaSerenaFun",
			amount: cost)
		redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token, review: false)
	end

	private
	def apartment_params
		params.require(:payment).permit(:apartment_id)
	end
end
