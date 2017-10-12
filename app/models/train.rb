class Train < ApplicationRecord
  belongs_to :route, optional: true
  # belongs_to :railway_station
  belongs_to :current_station, class_name: 'RailwayStation',foreign_key: :current_station_id
  
  has_many :tickets, dependent: :destroy
  has_many :cars, dependent: :destroy
  
  validates :number, presence: true
  
  def seats(car_type:, seats_type:)
    seats = Car.where(type: car_type).sum(seats_type.to_sym)
  end
  
  # def seats(cars)
  #   seats = {top_seats: 0, bottom_seats: 0}
  #   cars.each do |car|
  #     seats[:top_seats] += car.top_seats
  #     seats[:bottom_seats] += car.bottom_seats
  #   end
  #   seats
  # end
end
