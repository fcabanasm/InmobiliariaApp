class AddColumnReservepriceToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :reserveprice, :integer
  end
end
