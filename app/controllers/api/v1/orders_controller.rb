class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    orders = Order.where(date: Date.today)
    render json: orders, status: 200
  end
end