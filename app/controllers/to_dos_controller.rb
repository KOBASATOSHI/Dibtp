class ToDosController < ApplicationController
  
  def update
    @to_do = ToDo.find(params[:id])
    @to_do.close
    redirect_to root_url
  end
end
