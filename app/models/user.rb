class User < ApplicationRecord
  has_many :products

  validates :name, :email, presence: true
end
