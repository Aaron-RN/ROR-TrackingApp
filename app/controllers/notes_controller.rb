class NotesController < ApplicationController
  include SessionsHelper

  before_action :set_current_user, only: %i[create update destroy]
  before_action :set_note, only: %i[update destroy]

  def create
    food = Food.find(params[:food_id])
    note = food.notes.new(note_params)

    if note.save
      food_with_notes = Food.with_notes(params[:food_id])
      render json: {
        status: :ok,
        selected_food: food_with_notes,
        note: note
      }
    else
      render json: { status: 'ERROR', message: 'Note could not be created!',
                     error: note.errors.full_messages }, status: 500
    end
  end

  def update
    if @note.update(note_params)
      food_with_notes = Food.with_notes(params[:food_id])
      render json: {
        status: :ok,
        selected_food: food_with_notes,
        note: @note
      }
    else
      render json: { status: 'ERROR', message: 'Note could not be updated!',
                     error: @note.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    food_with_notes = Food.with_notes(params[:food_id])
    render json: { status: 'SUCCESS', message: 'Note was successfully deleted!',
                   note: @note, selected_food: food_with_notes }, status: :ok
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:body)
  end
end
