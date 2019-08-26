class ListsController < ApplicationController
  before_action :set_list, only: [:destroy, :edit, :update]

  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def edit; end

  def update
    if @list.update_attributes(list_params)
      flash[:notice] = I18n.t('success.messages.list.update_success', list_name: @list.name)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def create
    @list = List.new(list_params.merge(user_params))
    if @list.save
      flash[:notice] = I18n.t('success.messages.list.create_success', list_name: @list.name)
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    if @list.destroy
      flash[:notice] = I18n.t('success.messages.list.delete_success', list_name: @list.name)
    else
      flash[:alert] = I18n.t('error.messages.list.delete_fail', list_name: @list.name)
    end

    redirect_to action: :index
  end

  private

  def list_params
    params.permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
