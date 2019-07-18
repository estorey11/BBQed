class FoodSerializer < ActiveModel::Serializer
  attributes :id, :animal, :cut
  has_many :recipes
  has_many :users, through: :recipes
end
