class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    order = Order.new({user_id: current_user.id, date: Date.today, first_course_id: params[:first_course_id],
                      main_course_id: params[:main_course_id], drink_id: params[:drink_id]})
    order.calculate_total_amount
    order.save!
  end
end
