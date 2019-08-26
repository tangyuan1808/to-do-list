class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      session[:expires_at] = Time.current + 2.hours
      flash[:notice] = I18n.t('success.messages.login_success')
      redirect_to lists_path
    else
      flash[:alert] = I18n.t('error.messages.wrong_username_password')
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = I18n.t('success.messages.logout_success')
    redirect_to login_path
  end
end
