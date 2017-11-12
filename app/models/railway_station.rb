
class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id, dependent: :nullify
  # has_and_belongs_to_many :routes
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
  
  validates :title, presence: true
  
  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_serial_number').uniq }
  
  def update_serial_number(route:, position:)
    station_route = station_route(route)
    station_route.update(station_serial_number: position) if station_route
  end

  def position_in(route)
    station_route(route)&.station_serial_number
  end
  
  def update_time_arrival(time:, route:)
    update_time(time: time, time_type: 'time_arrival', route: route)
  end
  
  def update_time_departure(time:, route:)
    update_time(time: time, time_type: 'time_departure', route: route)
  end
  
  def arrival_at(route)
    station_route(route).try(:time_arrival).try(:strftime, '%H:%M')
  end
  
  def departure_at(route)
    station_route(route).try(:time_departure).try(:strftime, '%H:%M')
  end

  protected

  def station_route(route)
    railway_stations_routes.find_by(route: route)
  end
  
  def update_time(time:, time_type:, route:)
    station_route = station_route(route)
    station_route.update(time_type => time) if station_route
  end
end
