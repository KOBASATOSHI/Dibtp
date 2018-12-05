class ToDoGroupsController < ApplicationController
  
  def index
    @to_do_group = ToDoGroup.new
    @to_do_groups = ToDoGroup.all.active
  end
  
  # def new
  #   @to_do_group = ToDoGroup.new
  # end
  
  def show
    @to_do_group = ToDoGroup.find(params[:id])
    @to_do_master = @to_do_group.to_do_masters.new
    @to_do_masters = @to_do_group.to_do_masters.active
  end
  
  def create
    @to_do_group = ToDoGroup.new(to_do_group_params)
    
    if @to_do_group.save
      redirect_to to_do_groups_path
    else
      @to_do_groups = ToDoGroup.all.active
      render 'index'
    end
  end
  
  def edit
    @to_do_group = ToDoGroup.find(params[:id])
  end
  
  def update
    @to_do_group = ToDoGroup.find(params[:id])
    
    if @to_do_group.update_attributes(to_do_group_params)
      redirect_to to_do_groups_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @to_do_group = ToDoGroup.find(params[:id])
    @to_do_group.update(deleted: true, deleted_at: Date.today)
    redirect_to to_do_groups_path
  end
  
  private
  def to_do_group_params
    params.require(:to_do_group).permit(:name, :detail)
  end
end