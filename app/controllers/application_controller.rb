# rubocop:disable Layout/LineLength
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:dealer_id, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:dealer_id, :email, :password, :password_confirmation, :current_password) }
  end
end
# rubocop:enable Layout/LineLength
