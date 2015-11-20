class AddColumnStateToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :state, :string , default: "in_draft"
  end
end
