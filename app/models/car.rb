class Car < ApplicationRecord
  CAR_TYPES = %w(EconomCar BusinessCar SeatedCar SvCar).freeze

  belongs_to :train, optional: true
  
  validates :number, presence: true
  validates :type, inclusion: { in: CAR_TYPES, message: "%{type} is not a valid type" }
  
  # order by number by default
  # default_scope { order(:number) } 
  
  scope :economy, -> { where(type: 'EconomCar') }
  scope :business, -> { where(type: 'BusinessCar') }
  scope :seated, -> { where(type: 'SeatedCar') }
  scope :sv, -> { where(type: 'SvCar') }
  scope :ordered_asc, -> { order(number: :asc) }
  scope :ordered_desc, -> { order(number: :desc) }
  
  before_validation :set_number
  
  def kind
    case self.type
    when 'EconomCar' then 'economy'
    when 'BusinessCar' then 'business'
    when 'SeatedCar' then 'seated'
    when 'SvCar' then 'sv'
    else 'Car type was not set'
    end
  end
  
  def self.unique_types
      [['economy', 'EconomCar'], ['business', 'BusinessCar'], ['seated', 'SeatedCar'], ['sv', 'SvCar']]
  end
  
  def self.types
    CAR_TYPES 
  end
  
  private 
  
  def set_number
    if train.cars.size == 0
      self.number = 1
    else
      self.number = train.cars.maximum(:number).to_i + 1
    end
  end
    
  # def reset_number
  #   selected_train = Train.joins(:cars).where(cars: {train: :train})
  #   car_number = 1
  #   selected_train.cars.each do |car|
  #     car.number = car_number
  #     car_number += 1
  #   end
  # end
end
