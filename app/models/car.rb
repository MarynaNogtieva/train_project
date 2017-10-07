class Car < ApplicationRecord
  belongs_to :train, optional: true
  
  validates :number, :top_seats, :bottom_seats, presence: true
  
  # order by number by default
  # default_scope { order(:number) } 
  
  scope :economy, -> { where(type: 'EconomyCar')}
  scope :business, -> { where(type: 'BusinessCar')}
  scope :ordered, -> { order(:number) }
end
