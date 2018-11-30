class TaskMaster < ApplicationRecord
  has_many :user_task_masters
  has_many :users, through: :user_task_masters
  validates :name, presence: true, uniqueness: true
  validates :detail, presence: true
  
  enum category: {test0: 0, test1: 1,test2: 2,test3: 3}
  
end
