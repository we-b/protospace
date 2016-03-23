class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:name, :profile, :position, :occupation, :avatar)
    devise_parameter_sanitizer.for(:account_update).push(:name, :profile, :position, :occupation, :avatar)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
