class SmokerSerializer < ActiveModel::Serializer
  attributes :id, :name, :smoker_type
  has_many :recipes
  has_many :users, through: :recipes
end
