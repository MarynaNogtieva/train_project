class BusinessCar < Car
  validates :top_seats, :bottom_seats, presence: true
end