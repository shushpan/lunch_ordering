class Order < ApplicationRecord
  belongs_to :user

  def find_price_food_by_id(id)
    id.zero? ? 0 : Food.find(id).price
  end

  def calculate_total_amount
    self.total_amount = find_price_food_by_id(self.first_course_id) + find_price_food_by_id(self.main_course_id) +
                        find_price_food_by_id(self.drink_id)
  end
end
