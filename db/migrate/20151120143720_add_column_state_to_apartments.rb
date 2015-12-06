class AddColumnStateToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :state, :string , default: "unpublished_unrented"
  end
end
