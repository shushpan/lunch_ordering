class Admin::FoodsController < ApplicationController
  before_action :authenticate_user!, :is_user_admin

  def new

  end

  def create
    @food = Food.new(permitted_params)
    @food.date = Date.today
  end

  private

  def permitted_params
    params.require(:food).permit(:name, :food_type, :price, :photo)
  end
end
