class RecipeSerializer < ActiveModel::Serializer

  attributes :id, :food_unit, :food_amount, :temp, :wood, :time, :result, :rub, :wrap, :results_image, :food

  belongs_to :user
  belongs_to :food
  belongs_to :smoker
  has_many :comments

end
