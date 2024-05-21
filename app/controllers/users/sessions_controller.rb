# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


    def after_sign_in_path_for(resource)
      employee = Employee.find_by(emp_id: resource.emp_id)
      
      if employee.present?
        case employee.access
        when 'FA'
          fa_path(employee.emp_id) # Redirect to /fa/<emp_id> for FA access
        when 'SUP'
          employees_path # Redirect to /disciplines for SUP access
        else
          fa_path(employee.emp_id)# Default path if no access or other access levels
        end
      else
        root_path # Redirect to root if no employee is found
      end
    end
  end
