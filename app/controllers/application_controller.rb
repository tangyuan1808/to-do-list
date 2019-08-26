class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :current_user

  def authenticate_user!
    redirect_to root_path, notice: I18n.t('error.messages.session_expire') unless current_user && session[:expires_at] > Time.current
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
