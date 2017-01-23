class Food < ApplicationRecord
  validates :date, presence: true
  validates :name, :food_type, presence: true, length: {minimum: 2, maximum: 30}
  validates :price, presence: true, length: {maximum: 6}
end
