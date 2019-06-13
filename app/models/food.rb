class Food < ApplicationRecord
  has_many :recipes
  has_many :users, through: :recipes
  validates :animal, presence: true
  validates :cut, presence: true
end
