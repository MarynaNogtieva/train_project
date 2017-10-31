class User < ApplicationRecord
  has_many :tickets, dependent: :destroyxx
  validates :first_name, :last_name, :email, presence: true
end