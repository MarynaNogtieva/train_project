class User < ApplicationRecord
  has_many :tickets, dependent: :destroy
  
  # TODO: add validation regex for email
  validates :first_name, :last_name, :email, presence: true
end