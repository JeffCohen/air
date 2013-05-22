class RemoveMilesAndArrivesAtFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :miles
    remove_column :flights, :arrives_at
  end
end
