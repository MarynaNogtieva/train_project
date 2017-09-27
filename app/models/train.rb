class Train < ApplicationRecord
  validates :number, presence: true
  
  # belongs_to :railway_station
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
end
