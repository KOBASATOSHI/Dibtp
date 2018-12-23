class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  
  def index
  end

  def show
    @to_dos = current_user.to_dos.on_going
  end
end
