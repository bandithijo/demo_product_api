class Product < ApplicationRecord
  belongs_to :user

  validates :name, :price, :category, :user, presence: true
end
