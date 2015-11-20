class WelcomeController < ApplicationController
	
  def index
  end

  def dashboard
  	#@apartments = Apartment.paginate(page:params[:page], per_page:6).publicados.ultimos
  	@apartments = Apartment.all
  end
end
