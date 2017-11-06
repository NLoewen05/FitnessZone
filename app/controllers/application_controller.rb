class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName, :username, :password, :password_confirmation, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName, :username, :email, :password, :password_confirmation])

  end

end
