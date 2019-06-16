class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def new
    @list = List.new
  end

  def edit

  end

  def create
    @list = List.new(list_params.merge(user_params))
    if @list.save
      flash[:notice] = "list #{@list.name} create succeed"
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    list = List.find(params[:id])
    if current_user.id == list.user_id
      if list.destroy
        flash[:notice] = "list #{list.name} is destroyed!"
      else
        flash[:notice] = "list #{list.name} can not be destroyed!"
      end
    else
      flash[:notice] = "you do not have permission to delete this list"
    end
    redirect_to action: :index
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end