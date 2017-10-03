class Car < ApplicationRecord
  belongs_to :train, optional: true
  validates :number, presence: true
  
end
