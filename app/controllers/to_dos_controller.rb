class ToDosController < ApplicationController
  before_action :sign_in_required
  
  def update
    @to_do = ToDo.find(params[:id])
    @to_do.close
    redirect_to root_url
  end
end
