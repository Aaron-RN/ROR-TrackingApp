class FoodsController < ApplicationController
  include SessionsHelper

  before_action :set_current_user
  before_action :set_food, only: %i[show update destroy]

  def index
    render json: {
      food: Food.where(user: @current_user),
      selected_food: {}
    }
  end

  def show
    if @food
      render json: {
        status: :ok,
        food: @food,
        selected_food: @selected_food
      }
    else
      render json: { status: 'ERROR', message: 'Food could not be found!',
                     error: @food.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def create
    food = @current_user.foods.new(food_params)

    if food.save
      render json: {
        status: :created,
        food: Food.where(user: @current_user),
        selected_food: food
      }
    else
      render json: { status: 'ERROR', message: 'Food could not be created!',
                     error: food.errors.full_messages }, status: 500
    end
  end

  def update
    if @food.update(food_params)
      render json: {
        status: :ok,
        food: @food,
        selected_food: @selected_food
      }
    else
      render json: { status: 'ERROR', message: 'Food could not be updated!',
                     error: @food.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy
    render json: { status: 'SUCCESS', message: 'Food was successfully deleted!',
                   food: @food, selected_food: @selected_food }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.where(user: @current_user)
    @selected_food = Food.with_notes(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :date_consumed, :servings_consumed, :carbs, :fats, :proteins)
  end
end
