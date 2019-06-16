class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:expires_at] = Time.current + 2.hours
      flash[:notice] = "登录成功!"
      redirect_to lists_path
    else
      flash[:alert] = "邮箱或密码无效"
      render "new"
    end
  end

  def destroy
    session[:user_id] = ni
    flash[:notice] = "登出成功!"
    redirect_to login_path
  end
end
