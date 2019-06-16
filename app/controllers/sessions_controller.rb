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
    session[:user_id] = nil
    flash[:notice] = "登录失败!"
    redirect_to root_url
  end
end
