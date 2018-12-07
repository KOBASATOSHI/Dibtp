class ToDoGroup < ApplicationRecord
  has_many :to_do_masters
  has_many :user_to_do_groups
  has_many :users, through: :user_to_do_groups
  validates :name, presence: true, uniqueness: true
  
  scope :active, -> {where(deleted: false)}
end
