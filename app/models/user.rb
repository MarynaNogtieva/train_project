class User < ApplicationRecord
  has_many :tickets, dependent: :destroy
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  # TODO: add validation regex for email
  validates :email, presence: true
  validates :category, presence: true
end