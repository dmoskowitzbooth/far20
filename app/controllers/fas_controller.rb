class FasController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_fa_access, only: [:show]

  def index
    the_id = current_user.employee.emp_id
    today = Date.today

    matching_employees = Employee.where({ :emp_id => the_id })

    @the_employee = matching_employees.at(0)

    matching_disciplines = Discipline.where({ :emp_id => the_id }).where('expires >= ?', today)
    matching_disciplines_exp = Discipline.where({ :emp_id => the_id }).where('expires < ?', today)
    @list_of_disciplines = matching_disciplines.order({ :level => :desc })
    @list_of_disciplines_exp = matching_disciplines_exp.order({ :expires => :desc })
    
    @max_disciplines = @list_of_disciplines.order({:level => :desc}).first

    @max_disciplines_exp = @list_of_disciplines.order({:expires => :desc}).first

    #notes
    matching_notes = Note.where({ :emp_id => the_id })
    @list_of_notes = matching_notes.order({ :created_at => :desc })

    render({ :template => "fa/landing" })
  end

  def dshow
    the_id = params.fetch("path_id")
    the_typedid=params.fetch("emp_id")
    the_emp=current_user.employee.emp_id

    if params.fetch("emp_id")==current_user.emp_id.to_s

    matching_disciplines = Discipline.where({ :id => the_id }).where({:emp_id => the_emp})

    @the_discipline = matching_disciplines.at(0)

    render({ :template => "fa/discshow" })

    else 
      render({ :template => "fa/unauth" })
    end
  end

  def unauth
    render({ :template => "fa/unauth" })
  end

  def msgindex
    matching_messages = Message.where({:emp_id => current_user.employee.emp_id}).all

    @list_of_messages = matching_messages.order({ :created_at => :desc })

    render({ :template => "fa/listmessages" })
  end

    def msgshow
      the_id = params.fetch("path_id")
      the_typedid=params.fetch("emp_id")
      the_emp=current_user.employee.emp_id
  
      if params.fetch("emp_id")==current_user.emp_id.to_s
  
      matching_messages = Message.where({ :id => the_id })
  
      @the_message = matching_messages.at(0)
  
      render({ :template => "fa/messages" })
    else 
      render({ :template => "fa/unauth" })
    end
    end

  def authorize_fa_access
    Rails.logger.debug "Current user: #{current_user.inspect}"
    Rails.logger.debug "Current user emp_id: #{current_user.emp_id}"
    Rails.logger.debug "Params path_id: #{params[:path_id]}"
    @user=User.find(params[:id])
    if current_user.employee.access == 'FA' && current_user.emp_id.to_s != @user
      flash[:alert] = "You are not authorized to view this page."
      redirect_to root_path
    end
  end
end
end
