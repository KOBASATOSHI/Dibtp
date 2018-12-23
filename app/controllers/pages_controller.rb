class PagesController < ApplicationController
  def index
  end

  def show
    @to_dos = current_user.to_dos.on_going
  end
end
