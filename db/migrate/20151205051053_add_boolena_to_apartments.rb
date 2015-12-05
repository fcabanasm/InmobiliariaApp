class AddBoolenaToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :wifi, :boolean, :default => false
    add_column :apartments, :tv, :boolean, :default => false
    add_column :apartments, :radio, :boolean, :default => false
    add_column :apartments, :tvcable, :boolean, :default => false
    add_column :apartments, :parking, :boolean, :default => false
  end
end
