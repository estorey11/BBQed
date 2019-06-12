require 'pry'
class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :food
  belongs_to :smoker

  def food_attributes=(food)
    self.food = Food.find_or_create_by(animal: food[:animal], cut: food[:cut])
    self.food.update(food)
  end

  def smoker_attributes=(smoker)
    self.smoker = Smoker.find_or_create_by(name: smoker[:name], smoker_type: smoker[:type])
    self.smoker.update(smoker)
  end

  def self.with_animal_and_smoker_type
  end

  def self.with_animal
  end

  def self.with_smoker_type
  end
end
