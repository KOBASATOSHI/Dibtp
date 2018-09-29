module UsersHelper
  def correct_user
    @user = User.find(params[:id])
    redirect_to login_path unless current_user?(@user)
  end
end
