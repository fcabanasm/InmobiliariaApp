class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :cover
      t.references :apartment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
