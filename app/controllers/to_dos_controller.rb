class ToDosController < ApplicationController

  before_action :set_list

  def index
    @to_dos = @list.to_dos
  end

  def new
    @to_do = ToDo.new
  end

  def edit

  end

  def create
    @to_do = ToDo.new(to_do_params.merge(user_params).merge(list_params))
    if @to_do.save
      flash[:notice] = "#{@to_do.name} create succeed"
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    to_do = ToDo.find(params[:id])
    if current_user.id == to_do.user_id
      if to_do.destroy
        flash[:notice] = "#{to_do.name} is destroyed!"
      else
        flash[:notice] = "#{to_do.name} can not be destroyed!"
      end
    else
      flash[:notice] = "you do not have permission to delete this list"
    end
    redirect_to action: :index
  end

  private

  def set_list
    @list = List.find(list_params[:list_id])
  end

  def to_do_params
    params.require(:to_do).permit(:name, :description)
  end

  def list_params
    params.permit(:list_id)
  end
end