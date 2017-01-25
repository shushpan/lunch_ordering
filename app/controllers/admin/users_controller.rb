class Admin::UsersController < ApplicationController
  before_action :authenticate_user!, :is_user_admin
  USER_PER_PAGE = 10

  def index
    @users = User.paginate(page: params[:page], per_page: USER_PER_PAGE)
  end
end
