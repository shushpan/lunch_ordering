class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def get_foods_for_date
    date = params[:date]
    unless date.nil?
      @foods = Food.where(date: date)
      render partial: 'content_menu', locals: {date: date}
    end
  end

end
