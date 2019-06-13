class Smoker < ApplicationRecord
  has_many :recipes
  has_many :users, through: :recipes
  validates :smoker_type, presence: true
end
