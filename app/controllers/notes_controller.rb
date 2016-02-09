class NotesController < ApplicationController
  def new
    @issue_id = params[:issue_id]
    @note = Note.new
  end
  def create
    @note = Note.new(note_params)
    if @note.save!
      @issue = Issue.find_by_id(@note.issue_id)
      redirect_to @issue, notice: "Note has been created"
    else
      redirect_to :welcome, notice: "Note has not been created"
    end
  end

  private

  def note_params
    params.require(:note).permit(:message, :issue_id, :user_id)
  end
end
