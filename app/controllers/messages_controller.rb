class MessagesController < ApplicationController
  before_action :require_sup_access, only: [:index, :show]
  def index
    matching_messages = Message.all

    @list_of_messages = matching_messages.order({ :created_at => :desc })

    render({ :template => "messages/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_messages = Message.where({ :id => the_id })

    @the_message = matching_messages.at(0)

    render({ :template => "messages/show" })
  end

  def create
    the_message = Message.new
    the_message.emp_id = params.fetch("query_emp_id")
    the_message.sup_id = params.fetch("query_sup_id")
    the_message.subject = params.fetch("query_subject")
    the_message.message = params.fetch("query_message")


    if the_message.valid?
      the_message.save
      redirect_to("/messages", { :notice => "Message created successfully." })
    else
      redirect_to("/messages", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.emp_id = params.fetch("query_emp_id")
    the_message.sup_id = params.fetch("query_sup_id")
    the_message.subject = params.fetch("query_subject")
    the_message.message = params.fetch("query_message")
    the_message.read = params.fetch("query_read")

    if the_message.valid?
      the_message.save
      redirect_to("/messages/#{the_message.id}", { :notice => "Message updated successfully."} )
    else
      redirect_to("/messages/#{the_message.id}", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.destroy

    redirect_to("/messages", { :notice => "Message deleted successfully."} )
  end
end
