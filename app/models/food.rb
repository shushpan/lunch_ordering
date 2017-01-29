class Food < ApplicationRecord
  mount_uploader :photo, FoodUploader

  has_and_belongs_to_many :orders

  validates :date, presence: true
  validates :name, :food_type, presence: true, length: {minimum: 2, maximum: 30}
  validates :price, presence: true, length: {maximum: 6}
end
