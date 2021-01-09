class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    authorized = proc do |user|
      user.permit(:username, :email, :password, :password_confirmation, :current_password,
                  :role, :critics_count)
    end
    devise_parameter_sanitizer.permit(:sign_up, &authorized)
    devise_parameter_sanitizer.permit(:account_update, &authorized)
  end
end
