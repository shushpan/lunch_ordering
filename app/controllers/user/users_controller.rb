class User::UsersController < ApplicationController

  def check_email
    render plain: User.find_by_email(params[:user][:email].downcase).nil?
  end
end