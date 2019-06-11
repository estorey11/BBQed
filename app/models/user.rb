class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  has_many :foods, through: :recipes
  has_many :smokers, through: :recipes
end
