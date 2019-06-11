class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :food
  belongs_to :smoker

  accepts_nested_attributes_for :food
  accepts_nested_attributes_for :smoker
end
