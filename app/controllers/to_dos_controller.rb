class ToDosController < ApplicationController
  before_action :set_list
  before_action :set_to_do, only: [:edit, :destroy, :update]

  def index
    @to_dos = @list.to_dos
  end

  def new
    @to_do = ToDo.new
  end

  def edit; end

  def update
    if @to_do.update_attributes(to_do_params)
      flash[:notice] = "#{@to_do.name} 更新成功!"
      redirect_to action: :index
    else
      render :edit
    end
  end

  def create
    @to_do = ToDo.new(to_do_params.merge(user_params))
    if @to_do.save
      flash[:notice] = "#{@to_do.name} 创造成功!"
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    flash[:notice] = if @to_do.destroy
                       "#{@to_do.name} 删除成功!"
                     else
                       "#{@to_do.name} 无法删除!"
                     end
    redirect_to action: :index
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_to_do
    @to_do = ToDo.find(params[:id])
  end

  def to_do_params
    params.permit(:name, :description, :list_id)
  end
end
