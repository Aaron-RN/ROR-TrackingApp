class SessionsController < ApplicationController
  include SessionsHelper

  before_action :set_current_user, only: %i[logged_in]

  def create
    user = User.where(username: params['user']['username']).or(User.where(email: params['user']['email'])).first

    if user
      if user.try(:authenticate, params['user']['password'])
        session[:user_id] = user.id
        render json: {
          status: :created,
          logged_in: true,
          user: user
        }
      else
        render json: { status: 'ERROR', message: 'Could not log in!',
                       error: ['Incorrect Password'] }, status: 401
      end
    else
      render json: { status: 'ERROR', message: 'Could not log in!',
                     error: ['User does not exist'] }, status: 401
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else render json: { logged_in: false }
    end
  end

  def logout
    reset_session
    render json: {
      status: 200,
      logged_out: true
    }
  end
end
