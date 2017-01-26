class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!, if: :is_user_admin

  def index
    orders = Order.where(date: Date.today)
    render json: orders, status: 200
  end
end