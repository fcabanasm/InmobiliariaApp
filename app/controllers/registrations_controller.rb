class RegistrationsController < Devise::RegistrationsController
	def new
		super
	end
	def create
		super
	end
	def update
		super
	end
	private
	def sign_up_params
		allow = [:email, :name,:phone_number, :address,:rut, :password, :password_confirmation]
		params.require(resource_name).permit(allow)
	end

	def account_update_params
		allow = [:email, :name, :address, :phone_number,:rut, :password, :password_confirmation, :current_password]
		params.require(resource_name).permit(allow)
	end
end