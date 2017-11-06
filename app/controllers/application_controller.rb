class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
  
  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_root_path
    else
      search_path
    end
  end
end
