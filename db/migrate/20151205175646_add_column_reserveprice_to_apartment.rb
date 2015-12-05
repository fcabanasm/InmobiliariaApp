class AddColumnReservepriceToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :reservePrice, :integer
    rename_column :apartments, :price, :pernightPrice
    change_column :apartments, :rooms, :integer, :default => 0
    change_column :apartments, :bathrooms, :integer, :default => 0
  end
end
