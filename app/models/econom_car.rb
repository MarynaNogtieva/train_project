class EconomCar < Car
  validates :bottom_seats, :top_seats, :top_side_seats, :bottom_side_seats, presence: true
end