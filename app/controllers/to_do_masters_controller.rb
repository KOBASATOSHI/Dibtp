class ToDoMastersController < ApplicationController
  before_action :sign_in_required
  # def new
  #   @to_do_group = ToDoGroup.find(params[:to_do_group_id])
  #   @to_do_master= @to_do_group.to_do_masters.build
  # end
  
  def create
    @to_do_group = ToDoGroup.find(params[:to_do_group_id])
    @to_do_master = @to_do_group.to_do_masters.build(to_do_master_params)
    
    if @to_do_master.save
      redirect_to to_do_group_path(@to_do_group)
    else
      @to_do_masters = @to_do_group.to_do_masters.active
      render 'to_do_groups/show'
    end
  end
  
  def edit
    @to_do_master= ToDoMaster.find(params[:id])
  end
  
  def update
    @to_do_master= ToDoMaster.find(params[:id])
    if @to_do_master.update_attributes(to_do_master_params)
      redirect_to to_do_group_path(@to_do_master.to_do_group_id)
    else
      render 'edit'
    end
  end
  
  private
  def to_do_master_params
    params.require(:to_do_master).permit(:name, :detail, :order_number, :to_do_type, :deadline_days)
  end
end
