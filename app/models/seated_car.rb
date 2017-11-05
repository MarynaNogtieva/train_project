class SeatedCar < Car
  validates :seated_seats, presence: true
end