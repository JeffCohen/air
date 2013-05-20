class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :number
      t.time :departs_at
      t.time :arrives_at
      t.integer :miles
      t.integer :duration
      t.integer :seats
      t.integer :arrival_airport_id
      t.integer :departure_airport_id

      t.timestamps
    end
  end
end
