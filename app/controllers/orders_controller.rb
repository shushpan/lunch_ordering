class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    order = Order.new({user_id: current_user.id, date: Date.today})
    params[:foods].each { |food| order.foods << Food.find(food) if food.to_i != 0 }
    order.calculate_total_amount
    order.save!
  end
end
