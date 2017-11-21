class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_categories

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :username, :password, :password_confirmation, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :username, :email, :password, :password_confirmation])

  end

  def get_categories
    @categories = ProductCategory.all
  end

end
