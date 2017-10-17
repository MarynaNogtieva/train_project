class RailwayStationsRoute < ActiveRecord::Base
  belongs_to :railway_station
  belongs_to :route
  
  # uniqueness: true validation is global for the whole table
  validates :railway_station_id, uniqueness: { scope: :route_id }
end