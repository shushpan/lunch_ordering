class Admin::FoodsController < ApplicationController
  before_action :authenticate_user!, :is_user_admin

  def new
  @food = Food.new
  end

  def create
    @food = Food.new(permitted_params)
    @food.date = Date.today
    if @food.save!
      flash[:notice] = "You have successfully added food !"
      redirect_to new_admin_food_path
    end
  end

  private

  def permitted_params
    params.require(:food).permit(:name, :food_type, :price, :photo)
  end
end
