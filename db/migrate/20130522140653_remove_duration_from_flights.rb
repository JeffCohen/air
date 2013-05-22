class RemoveDurationFromFlights < ActiveRecord::Migration
  def change
    remove_column :flights, :duration
  end
end
