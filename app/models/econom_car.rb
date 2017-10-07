class EconomCar < Car
  validates :top_side_seats, :bottom_side_seats, presence: true
end