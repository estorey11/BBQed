require 'pry'
class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :food
  belongs_to :smoker
  has_many :comments

  validates :food_id, presence: true
  #validates :smoker_id, presence: true
  validates :time, presence: true
  validates :temp, presence: true
  validates :time, :inclusion => 0..24
  validates :temp, :inclusion => 100..600

  has_attached_file :results_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :results_image, content_type: /\Aimage\/.*\z/

  def food_attributes=(food)
    self.food = Food.find_or_create_by(animal: food[:animal], cut: food[:cut])
    self.food.update(food)
  end

  def smoker_attributes=(smoker)
    self.smoker = Smoker.find_or_create_by(name: smoker[:name], smoker_type: smoker[:type])
    self.smoker.update(smoker)
  end

  def self.with_animal_and_smoker_type(animal, smoker_type)
    includes(:food, :smoker).where(foods: { animal: animal }, smokers: { smoker_type: smoker_type })
  end

  def self.with_animal(animal)
    includes(:food).where(foods: { animal: animal })
  end

  def self.with_smoker_type(smoker_type)
    includes(:smoker).where(smokers: { smoker_type: smoker_type })
  end
end
