class FasController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_fa_access, only: [:show]

  def index
    the_id = current_user.employee.emp_id
    today = Date.today

    matching_employees = Employee.where({ :emp_id => the_id })

    @the_employee = matching_employees.at(0)

    matching_disciplines = Discipline.where({ :emp_id => the_id }).where('expires >= ?', today)
    matching_messages =Message.where({ :emp_id => the_id }).where('read != true')
    matching_disciplines_exp = Discipline.where({ :emp_id => the_id }).where('expires < ?', today)
    @list_of_disciplines = matching_disciplines.order({ :level => :desc })
    @list_of_disciplines_exp = matching_disciplines_exp.order({ :expires => :desc })
    
    @max_disciplines = @list_of_disciplines.order({:level => :desc}).first

    @max_disciplines_exp = @list_of_disciplines.order({:expires => :desc}).first

    @list_of_messages = matching_messages.count

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
    
      the_ffmid=@the_message.ffm_id

      @the_ffm = FactFinding.where({ :id => the_ffmid }).at(0)
  

  
      render({ :template => "fa/messages/ffm" })
    else 
      render({ :template => "fa/unauth" })
    end
    end

    def read_message
      the_id = params.fetch("path_id")
     
      the_message = Message.where({ :id => the_id }).at(0)
      
      if params[:query_response].present?
      the_ffmid=the_message.ffm_id
      the_ffm = FactFinding.where({ :id => the_ffmid }).at(0)
      the_ffm.response=params.fetch("query_response")
      the_ffm.save
      end
      the_message.read = "true"
      
  
      if the_message.valid?
        the_message.save
        
        redirect_to("/famessages/#{the_message.id}/#{the_message.emp_id}", { :notice => "Message updated successfully."} )
      else
        redirect_to("/famessages/#{the_message.id}/#{the_message.emp_id}", { :alert => the_message.errors.full_messages.to_sentence })
      end
    end
    def signdisc
      the_id = params.fetch("path_id")
      the_discipline = Discipline.where({ :id => the_id }).at(0)
  
      the_discipline.fasign=params.fetch("query_signature")
  
      if the_discipline.valid?
        the_discipline.save
        redirect_to(request.referer { :notice => "Discipline updated successfully."} )
      else
        redirect_to(request.referer)
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
