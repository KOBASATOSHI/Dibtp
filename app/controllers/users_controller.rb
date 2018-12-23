class UsersController < ApplicationController
  before_action :sign_in_required
  
  # def new
  #   @user = User.new
  # end
  
  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     log_in @user
  #     redirect_to main_path
  #   else
  #     render 'new'
  #   end
  # end

  
  private
    def user_params
        params.require(:user).permit(:name)
    end
end
