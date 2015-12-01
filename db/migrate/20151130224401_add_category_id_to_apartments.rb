class AddCategoryIdToApartments < ActiveRecord::Migration
  def change
    add_reference :apartments, :category, index: true, foreign_key: true
  end
end
