class RegistrationsController < ApplicationController
  def create
    user = User.new(
      username: params['user']['username'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation']
    )

    if user.save
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
end
