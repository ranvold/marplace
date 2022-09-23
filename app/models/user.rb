class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :favorites, dependent: :destroy
  has_many :cars, through: :favorites
end
