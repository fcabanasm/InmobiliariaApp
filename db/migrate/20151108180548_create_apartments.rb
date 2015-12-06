class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :title
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.integer :rooms
      t.integer :bathrooms
      t.integer :price

      t.timestamps null: false
    end
  end
end
