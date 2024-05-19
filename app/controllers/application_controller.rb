class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:emp_id])
  end


  protected

  def require_sup_access
    unless current_user&.employee&.access == 'SUP'
      flash[:alert] = "You are not authorized to view this page."
      redirect_to fa_path
    end
  end


  skip_forgery_protection
end
