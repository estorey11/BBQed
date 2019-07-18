class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :recipes
  has_many :foods, through: :recipes
  has_many :smokers, through: :recipes
end
