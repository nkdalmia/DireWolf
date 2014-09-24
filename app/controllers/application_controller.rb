class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters

    if resource_class == User
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :phone
      devise_parameter_sanitizer.for(:account_update) { |u|
        u.permit(:name, :email, :password, :password_confirmation, :current_password)
      }
    elsif resource_class == Admin

      devise_parameter_sanitizer.for(:sign_in) { |u|
        u.permit(:username, :password)
      }

      devise_parameter_sanitizer.for(:sign_up) { |u|
        u.permit(:name, :username, :email, :password, :password_confirmation)
      }
      devise_parameter_sanitizer.for(:account_update) { |u|
          u.permit(:name, :email, :password, :password_confirmation, :current_password)
      }
    elsif resource_class == Employer

      devise_parameter_sanitizer.for(:account_update) { |u|
        u.permit(:company_name, :contact_name, :email, :password, :password_confirmation, :current_password)
      }
    end

  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    if resource_class == Admin
      new_admin_session_path
    elsif resource_class == Employer
      new_employer_session_path
    else
      root_path
    end
  end

end
