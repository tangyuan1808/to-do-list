class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:signup, :create]

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = I18n.t('success.messages.user.create_success', user_name: @user.name)
      redirect_to login_path
    else
      render :signup
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end
