class AddColumnVisitsCountToApartment < ActiveRecord::Migration
  def change
    add_column :apartments, :visits_count, :integer,:default => 0
  end
end
