class ProductSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :name, :price, :category, :image, :is_active, :user
end
