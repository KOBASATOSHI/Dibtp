class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :user_task_masters
  has_many :task_masters, through: :user_task_masters
end
