class Car < ApplicationRecord
  belongs_to :train, optional: true
  validates :number, :car_type, presence: true
  
end
