class AddDefaultValueToIsRentedAttribute < ActiveRecord::Migration
  def change
  	change_column :apartments, :is_rented, :boolean, :default => false
  end
end
