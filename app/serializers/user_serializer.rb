class UserSerializer < ActiveModel::Serializer
  has_many :products
  attributes :id, :name, :email
end
