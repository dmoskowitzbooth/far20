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
    the_discipline.ffm_id = params.fetch("query_ffm_id")

    ffm=params.fetch("query_ffm_id")

    the_fact_finding = FactFinding.where({ :id => ffm }).at(0)

    the_fact_finding.conclusion= params.fetch("query_level")

    #message
    level=params.fetch("query_level")
    discfor=params.fetch("query_title_for")
    fa_emp=params.fetch("query_emp_id")
    sup_emp=params.fetch("query_sup_id")

    msg=Message.new
    msg.emp_id=params.fetch("query_emp_id")
    msg.subject="Disciplinary Action"
    msg.sup_id=params.fetch("query_sup_id")
    msg.read="false"
    msg.message= <<~HTML


    <p>Based on a review of your employee records and actions, you have been issued a #{level} for #{discfor}</p>

<p>You can review the full details of this disciplinary action by visiting the Active Discipline section of your employee profile. As a reminder, disciplinary actions remain active for 365 days from the effective date.</p>

<p>Please feel free to reach out to me if you have any questions or need additional support.</p>
<br>
<br>
Thank you.

HTML
    #

    if the_discipline.valid?
      the_discipline.save
      msg.save
      the_fact_finding.save
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
