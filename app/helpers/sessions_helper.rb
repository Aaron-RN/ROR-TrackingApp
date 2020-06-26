module SessionsHelper
  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])

      unless @current_user
        reset_session
        render json: {
          status: 200,
          logged_out: true
        }
      end
    else
      render json: {
        status: 401,
        error: ['Not logged in']
      }
    end
  end
end
