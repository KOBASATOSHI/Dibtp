class PagesController < ApplicationController
  def index
    @to_dos = current_user.to_dos.on_going
  end

  def show
  end
end
