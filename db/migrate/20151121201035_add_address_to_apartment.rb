class AddAddressToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :address, :string
  end
end
