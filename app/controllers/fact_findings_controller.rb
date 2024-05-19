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

    # Note Creation
    to_discuss=params.fetch("query_to_discuss")

    note=Note.new
    note.emp_id = params.fetch("query_emp_id")
    note.sup_id = params.fetch("query_sup_id")
    note.title="FFM Scheduled"
    note.date=Date.today
    note.note="FFM scheduled to discuss #{to_discuss}."
    
    #

    # ffm notice
    to_discuss=params.fetch("query_to_discuss")
    date = params.fetch("query_date")
    time = params.fetch("query_time")
    fa_emp=params.fetch("query_emp_id")
    sup_emp=params.fetch("query_sup_id")


    msg=Message.new
    msg.emp_id=params.fetch("query_emp_id")
    msg.subject="FFM Notice"
    msg.sup_id=params.fetch("query_sup_id")
    msg.message= <<~HTML
    Dear #{fa_emp}, 
    <br>

    <p>In accordance with the Collective Bargaining Agreement (CBA), Article 18, Section B.1, a Fact-Finding Meeting has been scheduled for you to attend on #{date} at #{time} Base Local Time to discuss test.  Please confirm that you have received this FFM notification by marking this message as read.</p>

<p>This meeting will take place in person at your base. This meeting will be attended by Inflight Leadership. </p>

<p>If you need to reschedule for any reason, we will do a one time reschedule.  These meetings can only be scheduled on one of your days off and are typically not scheduled on weekends.</p>

<p>Since this meeting could lead to disciplinary action, you are entitled, if you wish, to have a union Representative join you in the meeting.  Please be advised that it is your responsibility to arrange for the Representative to attend. If they are unable to attend at the meeting time, you will need to request your one-time reschedule option.</p>

<p>You may decline/not attend this meeting and accept the corrective action if you so choose. If you choose not to attend the meeting, you accept the appropriate corrective action.</p>
<br>
<br>
Thank you.
#{sup_emp}
HTML


    ##

    if the_fact_finding.valid?
      the_fact_finding.save
      msg.save
      note.save
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
