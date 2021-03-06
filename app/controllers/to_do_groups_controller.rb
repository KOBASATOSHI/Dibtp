class ToDoGroupsController < ApplicationController
  before_action :sign_in_required
  
  def index
    @to_do_group = ToDoGroup.new
    @to_do_groups = ToDoGroup.all.active
  end
  
  def goal_index
    @current_active_to_do_group = current_user.current_active_to_do_group
    if !@current_active_to_do_group.nil?
      @goals = ToDoGroup.all.active.where("NOT id = ?", @current_active_to_do_group.id)
    else
      @goals = ToDoGroup.all.active
    end
  end
  
  # def new
  #   @to_do_group = ToDoGroup.new
  # end
  
  def show
    @to_do_group = ToDoGroup.find(params[:id])
    @to_do_master = @to_do_group.to_do_masters.new
    @to_do_masters = @to_do_group.to_do_masters.active.order('order_number')
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
  
  def register
    if !current_user.have_active_user_to_do_group?
      @to_do_group = ToDoGroup.find(params[:id])
      current_user.register_user_to_do_group(@to_do_group)
    end
    redirect_to pages_show_path
  end
  
  def release
    current_user.close_all
    @user_to_do_group = UserToDoGroup.find_to_do_group(current_user, ToDoGroup.find(params[:id]))
    if !@user_to_do_group.nil?
      @user_to_do_group.update(active: false)
    end
    redirect_to goal_index_to_do_groups_path
  end
  
  private
  def to_do_group_params
    params.require(:to_do_group).permit(:name, :detail)
  end
end
