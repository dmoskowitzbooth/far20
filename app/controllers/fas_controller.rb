class FasController < ApplicationController

  def index
    the_id = params.fetch("path_id")
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

end
