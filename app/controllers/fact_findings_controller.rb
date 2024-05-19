class FactFindingsController < ApplicationController
  def index
    matching_fact_findings = FactFinding.all

    @list_of_fact_findings = matching_fact_findings.order({ :created_at => :desc })

    render({ :template => "fact_findings/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_fact_findings = FactFinding.where({ :id => the_id })

    @the_fact_finding = matching_fact_findings.at(0)

    render({ :template => "fact_findings/show" })
  end

  def create
    the_fact_finding = FactFinding.new
    the_fact_finding.emp_id = params.fetch("query_emp_id")
    the_fact_finding.date = params.fetch("query_date")
    the_fact_finding.time = params.fetch("query_time")
    the_fact_finding.sup_id = params.fetch("query_sup_id")
    the_fact_finding.notes = params.fetch("query_notes")
    the_fact_finding.to_discuss = params.fetch("query_to_discuss")

    if the_fact_finding.valid?
      the_fact_finding.save
      redirect_to("/fact_findings", { :notice => "Fact finding created successfully." })
    else
      redirect_to("/fact_findings", { :alert => the_fact_finding.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_fact_finding = FactFinding.where({ :id => the_id }).at(0)

    the_fact_finding.emp_id = params.fetch("query_emp_id")
    the_fact_finding.date = params.fetch("query_date")
    the_fact_finding.time = params.fetch("query_time")
    the_fact_finding.sup_id = params.fetch("query_sup_id")
    the_fact_finding.notes = params.fetch("query_notes")
    the_fact_finding.to_discuss = params.fetch("query_to_discuss")

    if the_fact_finding.valid?
      the_fact_finding.save
      redirect_to("/fact_findings/#{the_fact_finding.id}", { :notice => "Fact finding updated successfully."} )
    else
      redirect_to("/fact_findings/#{the_fact_finding.id}", { :alert => the_fact_finding.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_fact_finding = FactFinding.where({ :id => the_id }).at(0)

    the_fact_finding.destroy

    redirect_to("/fact_findings", { :notice => "Fact finding deleted successfully."} )
  end
end
