module SessionsHelper
  def clean_session
    reset_session
    render json: {
      status: 200,
      logged_out: true
    }
  end

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])

      rescue_from ActiveRecord::RecordNotFound, with: :clean_session
    else
      render json: {
        status: 401,
        error: ['Not logged in']
      }
    end
  end
end
