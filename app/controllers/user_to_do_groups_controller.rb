class UserToDoGroupsController < ApplicationController
  
  # 達成時に動作
  # 達成後もそのUserToDoGroupはActiveのままにする
  def update
    @user_to_do_group = UserToDoGroup.find(params[:id])
    @user_to_do_group.update(achieved: true)
    redirect_to pages_show_path
  end
end