class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user

  def authenticate_user!
    unless current_user && session[:expires_at] > Time.current
      redirect_to root_path, notice: 'Session Expires'
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  private

  def user_params
    { user_id: current_user.id }
  end
end
