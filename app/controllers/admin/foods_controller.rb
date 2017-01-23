class Admin::FoodsController < ApplicationController
  before_action :authenticate_user!, :is_user_admin

  def new
  @food = Food.new
  end

  def create
    @food = Food.new(permitted_params)
    render json: params[:photo]
  end

  private

  def permitted_params
    params.require(:food).permit(:name, :food_type, :price, :photo)
  end
end
