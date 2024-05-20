class NotesController < ApplicationController
  before_action :require_sup_access, only: [:index, :show]
  def index
    matching_notes = Note.all

    @list_of_notes = matching_notes.order({ :created_at => :desc })

    render({ :template => "notes/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_notes = Note.where({ :id => the_id })

    @the_note = matching_notes.at(0)

    render({ :template => "notes/show" })
  end

  def create
    the_note = Note.new
    the_note.emp_id = params.fetch("query_emp_id")
    the_note.sup_id = params.fetch("query_sup_id")
    the_note.date = params.fetch("query_date")
    the_note.title = params.fetch("query_title")
    the_note.note = params.fetch("query_note")
    the_note.disc_id = params.fetch("query_disc_id")

    if the_note.valid?
      the_note.save
      redirect_to(request.referer, { notice: "Note created successfully." })
    else
      redirect_to("/notes", { :alert => the_note.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_note = Note.where({ :id => the_id }).at(0)

    the_note.emp_id = params.fetch("query_emp_id")
    the_note.sup_id = params.fetch("query_sup_id")
    the_note.date = params.fetch("query_date")
    the_note.title = params.fetch("query_title")
    the_note.note = params.fetch("query_note")
    the_note.disc_id = params.fetch("query_disc_id")

    if the_note.valid?
      the_note.save
      redirect_to("/notes/#{the_note.id}", { :notice => "Note updated successfully."} )
    else
      redirect_to("/notes/#{the_note.id}", { :alert => the_note.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_note = Note.where({ :id => the_id }).at(0)

    the_note.destroy

    redirect_to("/notes", { :notice => "Note deleted successfully."} )
  end
end
