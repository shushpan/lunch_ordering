class Food < ApplicationRecord
  validates :date, presence: true
  validates :name, :type, presence: true, length: {minimum: 2, maximum: 30}
  validates :price, presence: true, length: {maximum: 6}
end
