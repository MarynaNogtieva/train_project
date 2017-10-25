class CreateSearchTable < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.integer :start_station_id
      t.integer :end_station_id
      t.index :start_station_id
      t.index :end_station_id
    end
  end
end
