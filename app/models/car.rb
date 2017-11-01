class Car < ApplicationRecord
  CAR_TYPES = %w[EconomCar BusinessCar SeatedCar SvCar].freeze

  belongs_to :train, optional: true
  
  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }
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
    car_type_hash = { 'EconomCar' => 'economy', 
                       'BusinessCar' => 'business',
                       'SeatedCar' => 'seated', 
                       'SvCar' => 'sv' } 
   car_type_hash.fetch(type, 'Car type was not set')
  end
  
  def self.unique_types
      [['economy', 'EconomCar'], ['business', 'BusinessCar'], ['seated', 'SeatedCar'], ['sv', 'SvCar']]
  end
  
  def self.types
    CAR_TYPES 
  end
  
  private
  
  def set_number
    self.number = (train.cars.maximum(:number) || 0).next
  end
end

