class UserTaskMaster < ApplicationRecord
  belongs_to :user
  belongs_to :task_master
end
