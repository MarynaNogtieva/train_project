class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_xtation_id 
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  
  validates :price, presence: true, numericality: { greater_than: 0 }
end