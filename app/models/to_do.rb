class ToDo < ApplicationRecord
  belongs_to :user
  belongs_to :to_do_master
  
  validates :deadline, presence: true
  validates :count, presence: true
  
  scope :on_going, -> {where(done: false)}
  scope :fin, -> {where(done: true)}
  
  def create_next_to_do
    @to_do_master = self.to_do_master.get_next_to_do_master
    if !@to_do_master.nil?
      @to_do = @to_do_master.create_to_do(self.user, 1, Date.today)
      return @to_do
    end
  end
  
  def create_my_to_do
    @to_do_master = self.to_do_master
    @to_do = @to_do_master.create_to_do(self.user, self.count + 1, self.deadline)
    return @to_do
  end
  
  def close
    if !self.done?
      if self.to_do_master.repeat? then self.create_my_to_do end
      if self.count == 1 then self.create_next_to_do end
      self.update(done: true)
    end
  end
  
end