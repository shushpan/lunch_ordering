class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :telephone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :telephone])
  end

  def is_user_admin
    redirect_to root_path unless current_user.admin?
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
