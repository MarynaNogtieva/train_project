class Train < ApplicationRecord
  belongs_to :route
  # belongs_to :railway_station
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  
  has_many :tickets, dependent: :destroy
  
  validates :number, presence: true
  
end
