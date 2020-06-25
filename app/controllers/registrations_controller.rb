class RegistrationsController < ApplicationController
  def create
    user = User.create!(user_params)

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 'ERROR', message: 'Account could not be created!',
                     error: user.errors.full_messages }, status: 500
    end
  end
  
  private

  # only allow the white list through.
  def user_params
    params.require(:registration).require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
