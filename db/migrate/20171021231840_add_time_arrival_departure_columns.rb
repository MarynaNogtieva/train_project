class AddTimeArrivalDepartureColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :time_arrival, :datetime
    add_column :railway_stations_routes, :time_departure, :datetime
  end
end
