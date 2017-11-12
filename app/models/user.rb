class User < ApplicationRecord
  has_many :tickets, dependent: :destroy
  validates :first_name, :last_name, :email, presence: true
end