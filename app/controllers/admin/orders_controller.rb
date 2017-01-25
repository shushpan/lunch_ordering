class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!, :is_user_admin
  ORDER_PER_PAGE = 5

  def index

  end

  def get_orders_for_date
    date = params[:date]
    unless date.nil?
      @orders = Order.where(date: date).paginate(page: params[:page],per_page: ORDER_PER_PAGE)
      render partial: 'content_orders_list', locals: {date: date}
    end
  end
end
