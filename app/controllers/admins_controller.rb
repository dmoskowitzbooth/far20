class AdminsController < ApplicationController
  before_action :require_sup_access, only: [:index, :show]
  def admin
    sup=current_user.emp_id
    past_ffms = FactFinding.where({ :sup_id => sup }).where('date < ? OR response = ?', Date.today, 'Decline Meeting')
    @list_of_ffms=past_ffms.order({:date => :asc})

    resched_ffms=FactFinding.where({ :sup_id => sup }).where(response: 'Request Reschedule')
    @list_of_resched=resched_ffms.order({:date => :asc})
    
    render({ :template => "admin/admin" })





  end
end
