class Category < ActiveRecord::Base
	validates :name, presence: true
	has_many :apartments

	before_destroy :chequear_por_propiedades

	private

	  def chequear_por_propiedades
	    if apartments.any?
	    	return false
	    end
	  end
end