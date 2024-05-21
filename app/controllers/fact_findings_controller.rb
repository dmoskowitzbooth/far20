class FactFindingsController < ApplicationController
  before_action :require_sup_access, only: [:index, :show]
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
    # Initialize the FactFinding object with the provided parameters
    the_fact_finding = FactFinding.new(
      emp_id: params.fetch("query_emp_id"),
      date: params.fetch("query_date"),
      time: params.fetch("query_time"),
      sup_id: params.fetch("query_sup_id"),
      notes: params.fetch("query_notes"),
      to_discuss: params.fetch("query_to_discuss")
    )
  
    if the_fact_finding.valid?
      # Save the FactFinding object to get its ID
      the_fact_finding.save
  
      # Create and save the associated Note
      note = Note.new(
        emp_id: params.fetch("query_emp_id"),
        sup_id: params.fetch("query_sup_id"),
        title: "FFM Scheduled",
        date: Date.today,
        note: "FFM scheduled to discuss #{params.fetch("query_to_discuss")}."
      )
      note.save
  
      # Create and save the associated Message
      msg = Message.new
        msg.emp_id=params.fetch("query_emp_id")
        msg.sup_id=params.fetch("query_sup_id")
        msg.subject="FFM Notice"
        msg.read= "false"
        msg.message= <<~HTML
          <br>
          <p> As requested, your FFM that was initially scheduled for #{params.fetch("query_date")} at #{params.fetch("query_time")} Base Local Time has been rescheduled and ammended. The updated details can be found below:

          <p>In accordance with the Collective Bargaining Agreement (CBA), Article 18, Section B.1, a Fact-Finding Meeting has been scheduled for you to attend on <strong> #{params.fetch("query_date")} at #{params.fetch("query_time")}</strong> Base Local Time to discuss #{params.fetch("query_to_discuss")}.  Please confirm receipt of this notice and inform leadership of your intentions to attend or decline the meeting or request a one-time reschedule using the dropdown above. </p>
          <p>This meeting will take place in person at your base. This meeting will be attended by Inflight Leadership. </p>
          <p>If you need to reschedule for any reason, we will do a one time reschedule.  These meetings can only be scheduled on one of your days off and are typically not scheduled on weekends.</p>
          <p>Since this meeting could lead to disciplinary action, you are entitled, if you wish, to have a union Representative join you in the meeting.  Please be advised that it is your responsibility to arrange for the Representative to attend. If they are unable to attend at the meeting time, you will need to request your one-time reschedule option.</p>
          <p>You may decline/not attend this meeting and accept the corrective action if you so choose. If you choose not to attend the meeting, you accept the appropriate corrective action.</p>
          <br>
          Thank you.
        HTML
      
      # Set the ffm_id to the ID of the created FactFinding record
      msg.ffm_id = the_fact_finding.id
      msg.save
  
      redirect_to("/fact_findings", { notice: "Fact finding created successfully." })
    else
      redirect_to("/fact_findings", { alert: the_fact_finding.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
  

    the_fact_finding = FactFinding.where({ :id => the_id }).at(0)

    msg = Message.where({:ffm_id => the_id}).at(0)



    the_fact_finding.emp_id = params.fetch("query_emp_id")
    the_fact_finding.date = params.fetch("query_date")
    the_fact_finding.time = params.fetch("query_time")
    the_fact_finding.sup_id = params.fetch("query_sup_id")
    the_fact_finding.notes = params.fetch("query_notes")
    the_fact_finding.to_discuss = params.fetch("query_to_discuss")
    the_fact_finding.date2 = params.fetch("query_date2")
    the_fact_finding.time2 = params.fetch("query_time2")
    the_fact_finding.response=""


      msg.emp_id= params.fetch("query_emp_id")
      msg.sup_id=params.fetch("query_sup_id")
      msg.subject= "Updated FFM Notice"
      msg.read= "false"
      msg.message= <<~HTML
        <br>
        <p>As requested, we have rescheduled your FFM that was initially scheduled for #{params.fetch("query_date")} at #{params.fetch("query_time")} Base Local Time. The updated and ammended information is as follows:  </p>
        <p>In accordance with the Collective Bargaining Agreement (CBA), Article 18, Section B.1, a Fact-Finding Meeting has been scheduled for you to attend on <strong> #{params.fetch("query_date2")} at #{params.fetch("query_time2")} Base Local Time </strong> to discuss #{params.fetch("query_to_discuss")}.  Please use the dropdown above to inform us if you plan to attend the meeting or will decline it. Because you are only offered one reschedule, you no longer have the option of requesting another reschedule.</p>
        <p>This meeting will take place in person at your base. This meeting will be attended by Inflight Leadership. </p>
        <p>Since this meeting could lead to disciplinary action, you are entitled, if you wish, to have a union Representative join you in the meeting.  Please be advised that it is your responsibility to arrange for the Representative to attend. If they are unable to attend at the meeting time, you will need to request your one-time reschedule option.</p>
        <p>You may decline/not attend this meeting and accept the corrective action if you so choose. If you choose not to attend the meeting, you accept the appropriate corrective action.</p>
        <br>
        Thank you.
      HTML
    

    if the_fact_finding.valid?
      the_fact_finding.save
      msg.save
      redirect_to("/fact_findings/#{the_fact_finding.id}", { :notice => "Fact finding updated successfully."} )
    else
      redirect_to("/fact_findings/#{the_fact_finding.id}", { :alert => the_fact_finding.errors.full_messages.to_sentence })
    end
  end

  def mtgnotes
    the_id = params.fetch("path_id")
    the_fact_finding = FactFinding.where({ :id => the_id }).at(0)

    the_fact_finding.notes=params.fetch("query_notes")
    the_fact_finding.save
    redirect_to("/fact_findings/#{the_fact_finding.id}", { :notice => "Meeting notes added."} )
  end

  def destroy
    the_id = params.fetch("path_id")
    the_fact_finding = FactFinding.where({ :id => the_id }).at(0)

    the_fact_finding.destroy

    redirect_to("/fact_findings", { :notice => "Fact finding deleted successfully."} )
  end
end
