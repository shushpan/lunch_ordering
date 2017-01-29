module Admin::OrdersHelper

  def find_user_by_id id
    User.find(id)
  end

  def find_food order, type
    order.foods.find_by(food_type: type)
  end

  def calculate_total_cost_for_today
    total_cost = 0.0
    Order.where(date: Date.today).each{|order| total_cost += order.total_amount}
    return total_cost
  end
end
