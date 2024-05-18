class EmployeesController < ApplicationController
  def index

    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @list_of_employees = Employee.where("emp_id LIKE ? OR first_name LIKE ? OR last_name LIKE ?", search_term, search_term, search_term)
    else
      @list_of_employees = Employee.all
    end

    render({ :template => "employees/index" })
  end

  def show
    the_id = params.fetch("path_id")
    today = Date.today

    matching_employees = Employee.where({ :emp_id => the_id })

    @the_employee = matching_employees.at(0)

    matching_disciplines = Discipline.where({ :emp_id => the_id }).where('expires >= ?', today)
    matching_disciplines_exp = Discipline.where({ :emp_id => the_id }).where('expires < ?', today)
    @list_of_disciplines = matching_disciplines.order({ :expires => :desc })
    @list_of_disciplines_exp = matching_disciplines_exp.order({ :expires => :desc })

    render({ :template => "employees/show" })
  end

  def create
    the_employee = Employee.new
    the_employee.first_name = params.fetch("query_first_name")
    the_employee.last_name = params.fetch("query_last_name")
    the_employee.phone = params.fetch("query_phone")
    the_employee.base = params.fetch("query_base")
    the_employee.position = params.fetch("query_position")
    the_employee.emp_id = params.fetch("query_emp_id")
    the_employee.doh = params.fetch("query_doh")
    the_employee.access = params.fetch("query_access")
    the_employee.image = params.fetch("query_image")
    the_employee.email = params.fetch("query_email")

    if the_employee.valid?
      the_employee.save
      redirect_to("/employees", { :notice => "Employee created successfully." })
    else
      redirect_to("/employees", { :alert => the_employee.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_employee = Employee.where({ :emp_id => the_id }).at(0)

    the_employee.first_name = params.fetch("query_first_name")
    the_employee.last_name = params.fetch("query_last_name")
    the_employee.phone = params.fetch("query_phone")
    the_employee.base = params.fetch("query_base")
    the_employee.position = params.fetch("query_position")
    the_employee.emp_id = params.fetch("query_emp_id")
    the_employee.doh = params.fetch("query_doh")
    the_employee.access = params.fetch("query_access")
    the_employee.image = params.fetch("query_image")
    the_employee.email = params.fetch("query_email")

    if the_employee.valid?
      the_employee.save
      redirect_to("/employees/#{the_employee.emp_id}", { :notice => "Employee updated successfully."} )
    else
      redirect_to("/employees/#{the_employee.emp_id}", { :alert => the_employee.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_employee = Employee.where({ :emp_id => the_id }).at(0)

    the_employee.destroy

    redirect_to("/employees", { :notice => "Employee deleted successfully."} )
  end
end
