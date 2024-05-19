class DisciplinesController < ApplicationController
  before_action :require_sup_access, only: [:index, :show]
  def index
    matching_disciplines = Discipline.all

    @list_of_disciplines = matching_disciplines.order({ :created_at => :desc })

    render({ :template => "disciplines/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_disciplines = Discipline.where({ :id => the_id })

    @the_discipline = matching_disciplines.at(0)

    render({ :template => "disciplines/show" })
  end

  def create
    the_discipline = Discipline.new
    the_discipline.emp_id = params.fetch("query_emp_id")
    the_discipline.sup_id = params.fetch("query_sup_id")
    the_discipline.level = params.fetch("query_level")
    the_discipline.effective = params.fetch("query_effective")
    the_discipline.expires = params.fetch("query_expires")
    the_discipline.reason = params.fetch("query_reason")
    the_discipline.expectations = params.fetch("query_expectations")
    the_discipline.notes = params.fetch("query_notes")
    the_discipline.title_for = params.fetch("query_title_for")

    if the_discipline.valid?
      the_discipline.save
      redirect_to("/disciplines", { :notice => "Discipline created successfully." })
    else
      redirect_to("/disciplines", { :alert => the_discipline.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_discipline = Discipline.where({ :id => the_id }).at(0)

    the_discipline.emp_id = params.fetch("query_emp_id")
    the_discipline.sup_id = params.fetch("query_sup_id")
    the_discipline.level = params.fetch("query_level")
    the_discipline.effective = params.fetch("query_effective")
    the_discipline.expires = params.fetch("query_expires")
    the_discipline.reason = params.fetch("query_reason")
    the_discipline.expectations = params.fetch("query_expectations")
    the_discipline.notes = params.fetch("query_notes")
    the_discipline.title_for = params.fetch("query_title_for")

    if the_discipline.valid?
      the_discipline.save
      redirect_to("/disciplines/#{the_discipline.id}", { :notice => "Discipline updated successfully."} )
    else
      redirect_to("/disciplines/#{the_discipline.id}", { :alert => the_discipline.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_discipline = Discipline.where({ :id => the_id }).at(0)

    the_discipline.destroy

    redirect_to("/disciplines", { :notice => "Discipline deleted successfully."} )
  end
end
