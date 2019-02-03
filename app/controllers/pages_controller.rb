class PagesController < ApplicationController
  before_action :sign_in_required, only: [:show]
  
  def index
    if user_signed_in?
      redirect_to pages_show_path
    end
  end

  def show
    @to_do_group = current_user.current_active_to_do_group
    @to_dos = current_user.to_dos.on_going
    @fin_to_dos = current_user.to_dos.fin
    if !@to_do_group.nil?
      @to_do_masters_count = @to_do_group.to_do_masters.count
      @user_to_do_group_start_count = current_user.user_to_do_groups.active[0].start_count
      @to_dos = current_user.to_dos.on_going
      
      # 現在ActiveなToDoGroupのToDoだけ取得する
      @to_do_masters_ids = @to_do_group.to_do_master_ids
      @fin_to_dos = current_user.to_dos.where(to_do_master_id: @to_do_masters_ids).fin
      
      @fin_to_dos_count = @fin_to_dos.where("count= ? and start_count = ?", 1, @user_to_do_group_start_count).count
      @fin_rate = @to_do_masters_count > 0 ? (@fin_to_dos_count.to_f / @to_do_masters_count.to_f).round(3) * 100 : 0
    end
  end
end
