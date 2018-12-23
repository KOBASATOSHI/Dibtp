class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  
  def index
    if user_signed_in?
      redirect_to pages_show_path
    end
  end

  def show
    @to_dos = current_user.to_dos.on_going
  end
end
