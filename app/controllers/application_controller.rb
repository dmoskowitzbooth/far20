class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:emp_id])
  end
  def require_fa_or_sup_access
    unless current_user.employee.access.in?(['FA', 'SUP'])
      flash[:alert] = "You do not have permission to access this page."
      redirect_to root_path
    end
    def require_sup_access
      unless current_user.employee.access == 'SUP'
        flash[:alert] = "You do not have permission to access this page."
        redirect_to root_path
      end
      def require_fa_access
        unless current_user.employee.access == 'FA'
          flash[:alert] = "You do not have permission to access this page."
          redirect_to root_path
        end
      end
    end
  end

  protected



  skip_forgery_protection
end
