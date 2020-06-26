class NotesController < ApplicationController
  include SessionsHelper

  before_action :set_current_user, only: %i[create update destroy]
  before_action :set_note, only: %i[update destroy]

  def create
    food = Food.find(params[:food_id])
    note = food.notes.build(note_params)

    if note.save
      render json: {
        status: :ok,
        note: note
      }
    else
      render json: { status: 'ERROR', message: 'Note could not be created!',
                     error: note.errors.full_messages }, status: 500
    end
  end

  def update
    if @note.update(note_params)
      render json: {
        status: :ok,
        note: note
      }
    else
      render json: { status: 'ERROR', message: 'Note could not be updated!',
                     error: @note.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    render json: { status: 'SUCCESS', message: 'Note was successfully deleted!',
                   food: @note }, status: :ok
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body)
  end
end
