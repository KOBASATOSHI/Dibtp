class ToDoMaster < ApplicationRecord
  belongs_to :to_do_group
  
  validates :name, presence: true
  validates :detail, presence: true
  validates :order_number, presence: true
  validates :to_do_type, presence: true
  validates :deadline_days, presence: true
  
  enum to_do_type: {one_time: 0, repeat: 1}
  
  scope :active, -> {where.not(created_at: nil)}


  def get_next_to_do_master
    my_to_do_group = self.to_do_group
    to_do_masters = my_to_do_group.to_do_masters.order(:order_number)
    
    if to_do_masters.count < 2
      return nil
    end
    my_index = to_do_masters.index(self)
    
    return my_index == to_do_masters.count - 1 ? nil : to_do_masters[my_index + 1]
  end
  
  def create_to_do(user, count)
    @to_do = ToDo.create(
      user_id: user.id,
      to_do_master_id: self.id,
      deadline: Date.today + self.deadline_days,
      count: count
    )
    return @to_do
  end
end
