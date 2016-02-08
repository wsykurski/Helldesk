class NotesController < ApplicationController
  def new
    @note = Note.new
  end
  def create
    @note = Note.new(note_params)
    if @note.save!
      redirect_to :welcome, notice: "Note has been created"
    else
      redirect_to :welcome, notice: "Note has not been created"
    end
  end

  private

  def note_params
    params.require(:note).permit(:message, :issue_id, :user_id)
  end
end
