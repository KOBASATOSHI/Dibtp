class ToDoGroup < ApplicationRecord
  has_many :to_do_masters
  validates :name, presence: true, uniqueness: true
  
  scope :active, -> {where(deleted: false)}
end
