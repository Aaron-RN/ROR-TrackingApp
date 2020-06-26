module SessionsHelper
  def set_current_user
    puts "Session ID: #{session[:user_id]}"
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      puts "@Current User = #{@current_user}"
    else
      render json: {
        status: 401,
        error: ['Not logged in']
      }
    end
  end
end
