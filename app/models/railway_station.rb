
class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id, dependent: :nullify
  # has_and_belongs_to_many :routes
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
  
  validates :title, presence: true
  
  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_serial_number').uniq }
  
  def update_serial_number(route, position)
  
    station_route = station_route(route)
    puts "STATION_ROUTE = #{station_route}"
    station_route.update(station_serial_number: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:station_serial_number)
  end

  protected

  def station_route(route)
    @station_route = railway_stations_routes.where(route_id: route).first
  end
end
