class TransactionsController < ApplicationController
	def checkout
		@transaction = current_user.transactions.new(payerid: strong_params[:PayerID], token: strong_params[:token])
		@transaction.ip_address = request.remote_ip
		@transaction.save
		respond_to  do |format|
			if @transaction.pagar?
				format.html {redirect_to "/", notice: "Gracias por arrendar una propiedad con nosotros, no te arrepentiras"}
			else
				format.html {redirect_to shop_path}
			end
		end
	end

	private
	def strong_params
		params.permit(:token, :PayerID)
	end
end
