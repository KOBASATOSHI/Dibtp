class ToDoMaster < ApplicationRecord
  belongs_to :to_do_group
  
  validates :name, presence: true
  validates :detail, presence: true
  validates :order, presence: true
  validates :to_do_type, presence: true
  validates :deadline_days, presence: true
  
  enum to_do_type: {one_time: 0, repeat: 1}
  
  scope :active, -> {where.not(created_at: nil)}
end
