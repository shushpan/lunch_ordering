class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :foods

  def calculate_total_amount
    write_attribute :total_amount, foods.map(&:price).inject(:+)
  end
end
