class RailwayStation < ActiveRecord::Base
  has_many :trains, foreign_key: :current_station_id, dependent: :nullify
  # has_and_belongs_to_many :routes
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes
  
  validates :title, presence: true
  
  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_serial_number').uniq }
end
