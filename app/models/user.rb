class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  has_many :foods, through: :recipes
  has_many :smokers, through: :recipes

  validates :username, presence: true
  validates :username, uniqueness: true

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(username: auth.info.name).first_or_initialize do |user|
      user.username = auth.info.name
      user.password = user.password_confirmation = SecureRandom.urlsafe_base64(n=6)
    end
  end
end
