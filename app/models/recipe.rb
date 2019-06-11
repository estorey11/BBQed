class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :food
  belongs_to :smoker
end
