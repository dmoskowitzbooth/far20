class EmployeesController < ApplicationController
  def index
    matching_employees = Employee.all

    @list_of_employees = matching_employees.order({ :created_at => :desc })

    render({ :template => "employees/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_employees = Employee.where({ :id => the_id })

    @the_employee = matching_employees.at(0)

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

    if the_employee.valid?
      the_employee.save
      redirect_to("/employees", { :notice => "Employee created successfully." })
    else
      redirect_to("/employees", { :alert => the_employee.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_employee = Employee.where({ :id => the_id }).at(0)

    the_employee.first_name = params.fetch("query_first_name")
    the_employee.last_name = params.fetch("query_last_name")
    the_employee.phone = params.fetch("query_phone")
    the_employee.base = params.fetch("query_base")
    the_employee.position = params.fetch("query_position")
    the_employee.emp_id = params.fetch("query_emp_id")
    the_employee.doh = params.fetch("query_doh")
    the_employee.access = params.fetch("query_access")
    the_employee.image = params.fetch("query_image")

    if the_employee.valid?
      the_employee.save
      redirect_to("/employees/#{the_employee.id}", { :notice => "Employee updated successfully."} )
    else
      redirect_to("/employees/#{the_employee.id}", { :alert => the_employee.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_employee = Employee.where({ :id => the_id }).at(0)

    the_employee.destroy

    redirect_to("/employees", { :notice => "Employee deleted successfully."} )
  end
end
