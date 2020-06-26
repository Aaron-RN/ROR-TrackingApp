module SessionsHelper
  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      render json: {
        status: 401,
        error: ['Not logged in']
      }
    end
  end
end
