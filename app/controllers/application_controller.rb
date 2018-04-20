class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

private
  def require_login
    #redirect_to new_session_path unless logged_in?
  end

  def logged_in?
    if @current_user.nil?
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
      session.delete :user_id unless @current_user # clear invalid session
    end
    @current_user
  end

  def sign_in(user)
    @current_user = user
    session[:user_id] = user.id
  end
end
