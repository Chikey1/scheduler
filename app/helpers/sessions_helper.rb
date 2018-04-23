module SessionsHelper
  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    if @current_user.nil?
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
      session.delete :user_id unless @current_user # clear invalid session
    end
    @current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end