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
      flash[:notice] = I18n.t('success.messages.todo.update_success', todo_name: @to_do.name)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def create
    @to_do = ToDo.new(to_do_params.merge(user_params))
    if @to_do.save
      flash[:notice] = I18n.t('success.messages.todo.create_success', todo_name: @to_do.name)
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    flash[:notice] = if @to_do.destroy
                       I18n.t('success.messages.todo.delete_success', todo_name: @to_do.name)
                     else
                       I18n.t('error.messages.todo.delete_fail', todo_name: @to_do.name)
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
