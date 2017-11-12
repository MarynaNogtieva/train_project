class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  
  has_many :tickets, dependent: :destroy
  has_many :cars, dependent: :destroy
  
  validates :number, presence: true
  
  def seats(car_type:, seats_type:)
    cars.where(type: car_type).sum(seats_type)
  end
end
