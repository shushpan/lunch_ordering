class Admin::FoodsController < ApplicationController
  before_action :authenticate_user!, :is_user_admin

  def new

  end
end
