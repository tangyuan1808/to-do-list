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
      flash[:notice] = "#{@list.name} 更新成功!"
      redirect_to action: :index
    else
      render :edit
    end
  end

  def create
    @list = List.new(list_params.merge(user_params))
    if @list.save
      flash[:notice] = "#{@list.name} 创造成功!"
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    if @list.destroy
      flash[:notice] = "#{@list.name} 删除成功!"
    else
      flash[:alert] = "#{@list.name} 无法删除!"
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
