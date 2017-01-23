module Admin::OrdersHelper

  def find_user_by_id id
    User.find(id)
  end

  def find_food_by_id id
    Food.find(id)
  end

  def calculate_total_cost_for_today
    total_cost = 0.0
    Order.where(date: Date.today).each{|order| total_cost += order.total_amount}
    return total_cost
  end
end
