class UsersController < ApplicationController
  before_action :sign_in_required
  
  # def new
  #   @user = User.new
  # end
  
  def show
  end
  
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     log_in @user
  #     redirect_to main_path
  #   else
  #     render 'new'
  #   end
  # end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      render 'edit'
    else
      render 'edit'
    end
  end
  
  private
    def user_params
        params.require(:user).permit(:username)
    end
end
